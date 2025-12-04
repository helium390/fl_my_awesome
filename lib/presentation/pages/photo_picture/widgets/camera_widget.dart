import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:image/image.dart' as img;

var cameraGlobalKey = GlobalKey<_CameraWidgetState>();

// ignore: must_be_immutable
class CameraWidget extends StatefulWidget {
  final double containerHeight;
  final bool isFrontCamera;
  Widget? overlay;

  CameraWidget({
    super.key,
    this.containerHeight = 220,
    this.isFrontCamera = false,
    this.overlay,
  });

  @override
  State<CameraWidget> createState() => _CameraWidgetState();
}

class _CameraWidgetState extends State<CameraWidget> {
  CameraController? cameraController;

  // Store the actual visible area calculations
  double? _visibleWidth;
  double? _visibleHeight;
  double? _scaleX;
  double? _scaleY;
  double? _offsetX;
  double? _offsetY;

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  Future<void> _initializeCamera() async {
    final cameras = await availableCameras();

    // Find front camera, fallback to first available
    final frontCamera = cameras.firstWhere(
      (camera) => camera.lensDirection == CameraLensDirection.front,
      orElse: () => cameras.first,
    );

    cameraController = CameraController(
      widget.isFrontCamera ? frontCamera : cameras.first,
      ResolutionPreset.veryHigh,
    );
    await cameraController!.initialize();

    /// Configure additional camera settings for better text capture:
    await cameraController!.setFocusMode(FocusMode.auto);
    await cameraController!.setFlashMode(FlashMode.auto);
    await cameraController!.setExposureMode(ExposureMode.auto);

    setState(() {});

    // Calculate visible area after initialization
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _calculateVisibleArea();
    });
  }

  void _calculateVisibleArea() {
    if (cameraController == null || !cameraController!.value.isInitialized) {
      return;
    }

    final RenderBox? renderBox =
        cameraGlobalKey.currentContext?.findRenderObject() as RenderBox?;
    if (renderBox == null) return;

    final containerSize = renderBox.size;
    final containerWidth = containerSize.width;
    final containerHeight = containerSize.height;

    // Get camera preview size
    final previewSize = cameraController!.value.previewSize!;
    final cameraWidth = previewSize.height; // Note: swapped for landscape
    final cameraHeight = previewSize.width;

    // Calculate how FittedBox.cover scales the preview
    final containerAspectRatio = containerWidth / containerHeight;
    final cameraAspectRatio = cameraWidth / cameraHeight;

    if (cameraAspectRatio > containerAspectRatio) {
      // Camera is wider - fit to height, crop width
      _scaleY = containerHeight / cameraHeight;
      _scaleX = _scaleY;
      _visibleHeight = containerHeight;
      _visibleWidth = cameraWidth * _scaleX!;
      _offsetX = (containerWidth - _visibleWidth!) / 2;
      _offsetY = 0.0;
    } else {
      // Camera is taller - fit to width, crop height
      _scaleX = containerWidth / cameraWidth;
      _scaleY = _scaleX;
      _visibleWidth = containerWidth;
      _visibleHeight = cameraHeight * _scaleY!;
      _offsetX = 0.0;
      _offsetY = (containerHeight - _visibleHeight!) / 2;
    }

    // print('Container: ${containerWidth}x$containerHeight');
    // print('Camera: ${cameraWidth}x$cameraHeight');
    // print('Scale: ${_scaleX}x$_scaleY');
    // print('Visible: ${_visibleWidth}x$_visibleHeight');
    // print('Offset: $_offsetX, $_offsetY');
  }

  @override
  Widget build(BuildContext context) {
    if (cameraController?.value.isInitialized != true) {
      return const SizedBox(
        height: 220,
        child: Center(child: CircularProgressIndicator()),
      );
    }

    return Stack(
      children: [
        Container(
          height: 220,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.black,
          ),
          clipBehavior: Clip.hardEdge,
          child: FittedBox(
            fit: BoxFit.cover,
            child: SizedBox(
              width: cameraController!.value.previewSize!.height,
              height: cameraController!.value.previewSize!.width,
              child: CameraPreview(cameraController!),
            ),
          ),
        ),
        widget.overlay != null ? widget.overlay! : const SizedBox(),
      ],
    );
  }

  @override
  void dispose() {
    cameraController?.dispose();
    super.dispose();
  }

  Future<String?> takePictureWithExactCrop() async {
    if (cameraController == null || !cameraController!.value.isInitialized) {
      return null;
    }

    if (_scaleX == null || _scaleY == null) {
      _calculateVisibleArea();
      if (_scaleX == null || _scaleY == null) return null;
    }

    try {
      final XFile picture = await cameraController!.takePicture();
      final bytes = await File(picture.path).readAsBytes();
      img.Image? originalImage = img.decodeImage(bytes);

      if (originalImage == null) return null;

      // Get container dimensions
      final RenderBox renderBox =
          cameraGlobalKey.currentContext!.findRenderObject() as RenderBox;
      final containerSize = renderBox.size;
      final containerWidth = containerSize.width;
      final containerHeight = containerSize.height;

      // print('Original image: ${originalImage.width}x${originalImage.height}');

      // Calculate crop rectangle in original image coordinates
      final originalWidth = originalImage.width;
      final originalHeight = originalImage.height;

      // The preview might be rotated, so we need to account for that
      final previewSize = cameraController!.value.previewSize!;

      int cropX, cropY, cropWidth, cropHeight;

      // Calculate the scale factor from preview to original image
      final scaleFactorX = originalWidth /
          previewSize.height; // Note: swapped because preview is rotated
      final scaleFactorY = originalHeight / previewSize.width;

      // print('Scale factors: ${scaleFactorX}x$scaleFactorY');

      // Calculate what portion of the original image corresponds to our container
      // The visible area in preview coordinates
      final previewVisibleWidth = containerWidth / _scaleX!;
      final previewVisibleHeight = containerHeight / _scaleY!;

      // print('Preview visible area: ${previewVisibleWidth}x$previewVisibleHeight');

      // Calculate the center offset in preview coordinates
      final previewCenterX = previewSize.height / 2; // Center of preview width
      final previewCenterY = previewSize.width / 2; // Center of preview height

      // Calculate crop area in preview coordinates (centered)
      final cropPreviewX = previewCenterX - (previewVisibleWidth / 2);
      final cropPreviewY = previewCenterY - (previewVisibleHeight / 2);

      // print('Preview crop start: $cropPreviewX, $cropPreviewY');

      // Convert to original image coordinates
      cropX = (cropPreviewX * scaleFactorX).round();
      cropY = (cropPreviewY * scaleFactorY).round();
      cropWidth = (previewVisibleWidth * scaleFactorX).round();
      cropHeight = (previewVisibleHeight * scaleFactorY).round();

      // Ensure crop rectangle is within bounds
      cropX = cropX.clamp(0, originalWidth - 1);
      cropY = cropY.clamp(0, originalHeight - 1);
      cropWidth = (cropWidth).clamp(1, originalWidth - cropX);
      cropHeight = (cropHeight).clamp(1, originalHeight - cropY);

      // print('Crop rectangle: $cropX, $cropY, ${cropWidth}x$cropHeight');

      // Crop the image
      img.Image croppedImage = img.copyCrop(
        originalImage,
        x: cropX,
        y: cropY,
        width: cropWidth,
        height: cropHeight,
      );

      // print('Cropped image: ${croppedImage.width}x${croppedImage.height}');

      // Resize to exact container dimensions
      img.Image finalImage = img.copyResize(
        croppedImage,
        width: containerWidth.round(),
        height: containerHeight.round(),
      );

      // print('Final image: ${finalImage.width}x${finalImage.height}');

      // Save the processed image
      final String finalPath = picture.path.replaceAll('.jpg', '_final.jpg');
      final File finalFile = File(finalPath);
      await finalFile.writeAsBytes(img.encodeJpg(finalImage, quality: 95));

      // Clean up original file
      await File(picture.path).delete();

      return finalFile.path;
    } catch (e) {
      // print('Error taking picture: $e');
      return null;
    }
  }
}
