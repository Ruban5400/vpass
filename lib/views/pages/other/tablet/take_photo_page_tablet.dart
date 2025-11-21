import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:visitor_pass/controller/checkin_controller.dart';
import 'package:visitor_pass/views/widget/custom_button.dart';
import '../../../../constants/constants.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';

import '../../../widget/loader.dart';

class TakePhotoPageTablet extends StatefulWidget {
  TakePhotoPageTablet({Key? key, required this.visitorData}) : super(key: key);
  final CheckInController checkInController = Get.put(CheckInController());
  final dynamic visitorData;
  @override
  State<TakePhotoPageTablet> createState() => _TakePhotoPageState();
}

class _TakePhotoPageState extends State<TakePhotoPageTablet> {
  File? image;
  final CheckInController checkInController = Get.put(CheckInController());
  Future getImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(
        source: source,
        imageQuality: 70,
        maxHeight: 600,
        maxWidth: 600,
        preferredCameraDevice: CameraDevice.front,
      );
      if (image == null) return;
      // final imageTemporary = File(image.path);
      final imagePermanent = await saveImage(image.path);
      setState(() {
        this.image = imagePermanent;
      });
    } on PlatformException {
      if (kDebugMode) {}
    }
  }

  Future<File> saveImage(String imagePath) async {
    final directory = await getApplicationDocumentsDirectory();
    final name = basename(imagePath);
    final image = File('${directory.path}/$name');
    return File(imagePath).copy(image.path);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'take_visitor_photo'.tr,
          style: const TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 20,
            color: AppColor.primaryColor,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Image.asset(Images.back),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: GetBuilder<CheckInController>(
        init: CheckInController(),
        builder: (controller) {
          return Stack(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 40, 20, 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    image != null
                        ? Column(
                            children: [
                              ClipOval(
                                child: Image.file(
                                  image!,
                                  width: 320.w,
                                  height: 320.h,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const SizedBox(height: 30),
                              SizedBox(
                                height: 48.h,
                                width: 160.w,
                                child: TextButton(
                                  style: TextButton.styleFrom(
                                    backgroundColor: AppColor.textButtonColor,
                                  ),
                                  onPressed: () {
                                    getImage(ImageSource.camera);
                                  },
                                  child: Text(
                                    'take_again'.tr,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: AppColor.primaryColor,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        : ClipOval(
                            child: Container(
                              width: 320.w,
                              height: 320.h,
                              color: AppColor.borderColor,
                            ),
                          ),
                    image != null
                        ? CustomButton(
                            title: 'continue'.tr,
                            onPressed: () {
                              checkInController.visitorPost(
                                context,
                                image!.path,
                                widget.visitorData,
                              );
                            },
                            primaryColor: AppColor.primaryColor,
                            onPrimaryColor: Colors.white,
                          )
                        : CustomButton(
                            title: 'take_your_picture'.tr,
                            onPressed: () {
                              getImage(ImageSource.camera);
                            },
                            primaryColor: AppColor.primaryColor,
                            onPrimaryColor: Colors.white,
                          ),
                  ],
                ),
              ),
              checkInController.loader
                  ? Positioned(
                      child: Container(
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width,
                        color: Colors.white60,
                        child: const Center(child: Loader()),
                      ),
                    )
                  : const SizedBox.shrink(),
            ],
          );
        },
      ),
    );
  }
}
