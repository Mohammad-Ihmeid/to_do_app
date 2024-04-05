import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:to_do_app/core/extension/responsive.dart';
import 'package:to_do_app/core/theme/app_color/app_color_light.dart';
import 'package:to_do_app/core/translation/app_string.dart';
import 'package:to_do_app/core/utils/app_values.dart';
import 'package:to_do_app/core/utils/assets_manager.dart';

class PickImageDialog {
  Future showPicker({required BuildContext context}) {
    return showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppBorderRadius.s12),
          ),
          backgroundColor: Colors.transparent,
          child: Container(
            margin: const EdgeInsets.only(left: 0.0, right: 0.0),
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(AppBorderRadius.s12),
                    color: AppColorsLight.primaryColor,
                  ),
                  padding: const EdgeInsets.all(AppPadding.p8),
                  margin: const EdgeInsets.only(
                    top: AppMargin.m13,
                    right: AppMargin.m8,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        AppString.selectImage,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      const SizedBox.shrink(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          GestureDetector(
                            onTap: () => selectImageFromCamera(context),
                            child: Card(
                              elevation: 5,
                              child: Padding(
                                padding: const EdgeInsets.all(AppPadding.p8),
                                child: Column(
                                  children: [
                                    Image.asset(
                                      ImagesAssets.cameraImage,
                                      scale: 1,
                                      width: 10.sW(context),
                                      height: 10.sH(context),
                                    ),
                                    Text(
                                      AppString.camera,
                                      style:
                                          Theme.of(context).textTheme.bodySmall,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () => selectImageFromGallery(context),
                            child: Card(
                              elevation: 5,
                              child: Padding(
                                padding: const EdgeInsets.all(AppPadding.p8),
                                child: Column(
                                  children: [
                                    Image.asset(
                                      ImagesAssets.galleryImage,
                                      scale: 1,
                                      width: 10.sW(context),
                                      height: 10.sH(context),
                                    ),
                                    Text(
                                      AppString.galleray,
                                      style:
                                          Theme.of(context).textTheme.bodySmall,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Positioned(
                  right: 0.0,
                  child: GestureDetector(
                    onTap: () => Navigator.of(context).pop(),
                    child: Align(
                      alignment: Alignment.topRight,
                      child: CircleAvatar(
                        backgroundColor: AppColorsLight.white,
                        child: Icon(
                          Icons.close,
                          color: AppColorsLight.error,
                          size: 25.sF(context),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  selectImageFromGallery(BuildContext context) async {
    XFile? file = await ImagePicker()
        .pickImage(source: ImageSource.gallery, imageQuality: 10);
    if (file != null) {
      if (context.mounted) {
        Navigator.pop(context, file.path);
      }
    }
  }

  selectImageFromCamera(BuildContext context) async {
    XFile? file = await ImagePicker()
        .pickImage(source: ImageSource.camera, imageQuality: 10);
    if (file != null) {
      if (context.mounted) {
        Navigator.pop(context, file.path);
      }
    }
  }
}
