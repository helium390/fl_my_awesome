import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../config/extensions.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../../domain/entities/photo.dart';

//ignore: must_be_immutable
class SelectCustomImg extends StatefulWidget {
  final Widget childWidget;
  final Function(String?, String?)? imageFunction;
  bool isLoading;

  SelectCustomImg({
    super.key,
    required this.childWidget,
    this.imageFunction,
    this.isLoading = false,
  });

  @override
  State<SelectCustomImg> createState() => _SelectCustomImgState();
}

class _SelectCustomImgState extends State<SelectCustomImg> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        widget.isLoading
            ? null
            : showModalBottomSheet(
                context: context,
                builder: (context) {
                  return Container(
                    height: 220.h,
                    color: AppColor.white,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      // crossAxisAlignment: CrossAxisAlignment.center,
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
                });
      },
      borderRadius: const BorderRadius.all(
        Radius.circular(10),
      ),
      child: widget.childWidget,
    );
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

  void setImage(Photo? photo, String? path) {
    setState(() {
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
