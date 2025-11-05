// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:visitor_pass/constants/constants.dart';
import 'package:visitor_pass/controller/appointment_controller.dart';
import 'package:visitor_pass/views/widget/custom_form_field.dart';
import 'package:visitor_pass/views/widget/form_title.dart';

import '../../../widget/loader.dart';

class AppointmentPageTablet extends StatelessWidget {
  AppointmentPageTablet({Key? key}) : super(key: key);
  final AppointmentController appointmentController = Get.put(
    AppointmentController(),
  );

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool validate = false;
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(1133, 744),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext context, Widget? child) {
        return Scaffold(
          backgroundColor: Colors.white,
          //resizeToAvoidBottomInset: false,
          body: GetBuilder<AppointmentController>(
            init: AppointmentController(),
            builder: (controller) {
              return Padding(
                padding: EdgeInsets.only(left: 60.w, top: 50.h),
                child: Form(
                  key: _formKey,
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                IconButton(
                                  icon: Image.asset(Images.back),
                                  onPressed: () {
                                    Get.back();
                                  },
                                ),
                                SizedBox(width: 100.w),
                                Text(
                                  'have_appointment'.tr,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 20.sp,
                                    color: AppColor.primaryColor,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 150.h),
                            FormTitle(title: 'visitor_email_phone'.tr),
                            CustomFormField(
                              controller:
                                  appointmentController.findEmailController,
                              validatorTxt: 'enter_email_or_phone'.tr,
                              readOnly: false,
                            ),
                            SizedBox(height: 34.h),
                            SizedBox(
                              height: 48.h,
                              width: double.infinity,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width: 160.w,
                                    height: 40.h,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        validate = false;
                                        Get.back();
                                        (context as Element).markNeedsBuild();
                                      },
                                      style: ElevatedButton.styleFrom(
                                        foregroundColor: AppColor.primaryColor,
                                        backgroundColor: AppColor.borderColor,
                                        elevation: 0,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            24.r,
                                          ),
                                        ),
                                      ),
                                      child: Text(
                                        'cancel'.tr,
                                        style: TextStyle(
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 160.w,
                                    height: 40.h,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        validateAndSave(context);
                                        (context as Element).markNeedsBuild();
                                      },
                                      style: ElevatedButton.styleFrom(
                                        foregroundColor: Colors.white,
                                        backgroundColor: AppColor.primaryColor,
                                        elevation: 0,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            24.r,
                                          ),
                                        ),
                                      ),
                                      child: Text(
                                        'continue'.tr,
                                        style: TextStyle(
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 50.w),
                      Expanded(
                        flex: 1,
                        child: Stack(
                          children: [
                            Positioned(
                              child: Container(
                                height: double.infinity,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(Images.bg),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.only(top: 195.h),
                                  child: Text(
                                    'make_visitor_id'.tr,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 40.sp,
                                      fontWeight: FontWeight.w700,
                                      color: AppColor.primaryColor,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            // Container(
                            //   height: double.infinity,
                            //   width: double.infinity,
                            //   decoration: BoxDecoration(
                            //     image: DecorationImage(
                            //         image: AssetImage(Images.bg),
                            //         fit: BoxFit.cover),
                            //   ),
                            //   child: Positioned(
                            //     child: Padding(
                            //       padding: EdgeInsets.only(top: 195.h),
                            //       child: Text(
                            //         'make_visitor_id'.tr,
                            //         textAlign: TextAlign.center,
                            //         style: TextStyle(
                            //             fontSize: 40.sp,
                            //             fontWeight: FontWeight.w700,
                            //             color: AppColor.primaryColor),
                            //       ),
                            //     ),
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                      appointmentController.loader
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
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }

  void validateAndSave(context) {
    final FormState? form = _formKey.currentState;
    if (form!.validate()) {
      FocusManager.instance.primaryFocus?.unfocus();
      appointmentController.qrcodeScan(false, '', '');
      validate = true;
    } else {
      validate = false;
    }
  }
}
