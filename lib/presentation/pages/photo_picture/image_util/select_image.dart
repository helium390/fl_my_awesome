import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../config/extensions.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../../domain/entities/photo.dart';

//ignore: must_be_immutable
class SelectImage extends StatefulWidget {
  final Function(String?, String?)? imageFunction;
  String? image; // For local
  Photo? photo;
  bool isLoading;
  String placeHolder;
  double? imgWidth;
  double? imgHeight;

  SelectImage({
    super.key,
    this.imageFunction,
    this.image,
    this.photo,
    this.isLoading = false,
    this.placeHolder = 'assets/images/placeholder.svg',
    this.imgWidth = 32.0,
    this.imgHeight = 32.0,
  });

  @override
  State<SelectImage> createState() => _SelectImageState();
}

class _SelectImageState extends State<SelectImage> {
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: Stack(
        alignment: Alignment.center,
        children: [
          widget.image != null ? fileImageWidget() : placeHolderWidget(),
        ],
      ),
    );
  }

  void callGalleryOption(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          height: 220.h,
          color: AppColor.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  selectImage(ImageSource.gallery);
                  Navigator.pop(context);
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(24),
                      decoration: const BoxDecoration(
                        color: AppColor.greyBg,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.photo_camera_back_outlined,
                        color: AppColor.black1,
                      ),
                    ),
                    20.ph,
                    Text(
                      'Gallery',
                      style: AppStyles.text18sp500black1,
                    ),
                  ],
                ),
              ),
              60.pw,
              InkWell(
                onTap: () {
                  selectImage(ImageSource.camera);
                  Navigator.pop(context);
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(24),
                      decoration: const BoxDecoration(
                        color: AppColor.greyBg,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.camera_alt_outlined,
                        color: AppColor.black1,
                      ),
                    ),
                    20.ph,
                    Text(
                      'Photo',
                      style: AppStyles.text18sp500black1,
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget placeHolderWidget() {
    return InkWell(
      onTap: () {
        widget.isLoading ? null : callGalleryOption(context);
      },
      borderRadius: BorderRadius.circular(5.0),
      child: Container(
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(
          color: AppColor.greyAreaColor,
          border: Border.all(color: AppColor.black.withAlpha(20)),
          borderRadius: BorderRadius.circular(5),
        ),
        child: !widget.isLoading
            ? Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SvgPicture.asset(
                    widget.placeHolder,
                    width: widget.imgWidth,
                    height: widget.imgHeight,
                  ),
                  Text(
                    'Add Photo',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppStyles.text14sp400black1,
                  ),
                ],
              )
            : const Center(
                child: CircularProgressIndicator.adaptive(
                  valueColor: AlwaysStoppedAnimation<Color>(AppColor.hintColor),
                ),
              ),
      ),
    );
  }

  Widget fileImageWidget() {
    return Container(
      alignment: Alignment.topRight,
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: FileImage(File(widget.image ?? "")),
          fit: BoxFit.cover,
        ),
        border: Border.all(color: AppColor.listDividerColor, width: 1),
        borderRadius: BorderRadius.circular(5),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: GestureDetector(
          onTap: removeImage,
          child: ClipOval(
            child: Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                border: Border.all(
                  width: 0.5,
                  color: Colors.white,
                ),
                color: Colors.black.withAlpha(65),
                borderRadius: BorderRadius.circular(50.0),
              ),
              child: const Icon(
                Icons.close,
                color: Colors.white,
                size: 16,
              ),
            ),
          ),
        ),
      ),
    );
  }

  void removeImage() {
    String key = widget.photo?.urlString ?? "";
    removeUploadedImage(key);
  }

  Future<void> removeUploadedImage(String key) async {
    // await ImageRepoImpl().apiRemovePhoto(key);
    setImage(null, null);
  }

  void selectImage(ImageSource imageSource) async {
    final ImagePicker picker = ImagePicker();
    final pickedFile = await picker.pickImage(
      source: imageSource,
      imageQuality: 60,
      maxWidth: 800,
    );

    if (pickedFile != null) {
      uploadImage(pickedFile.path);
    }
    setState(() {});
  }

  /// Upload Image to Server
  Future<void> uploadImage(String path) async {
    // changeLoading();
    // var either = await ImageRepoImpl().apiUploadPhoto(path);
    // changeLoading();
    // either.fold((l) {
    //   ToastService.showNotifMessage(l.description.toString());
    // }, (r) {
    //   setImage(r, path);
    // });
    setImage(null, path);
  }

  void setImage(Photo? photo, String? path) async {
    changeLoading();
    // Simulate a delay for loading effect
    await Future.delayed(const Duration(milliseconds: 500));
    changeLoading();
    setState(() {
      widget.photo = photo;
      widget.image = path;

      if (widget.imageFunction != null) {
        widget.imageFunction!(path, photo?.urlString);
      }
    });
  }

  void changeLoading() {
    setState(() {
      widget.isLoading = !widget.isLoading;
    });
  }
}
