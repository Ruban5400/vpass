// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:visitor_pass/constants/constants.dart';
import 'package:visitor_pass/controller/checkout_controller.dart';
import 'package:visitor_pass/views/widget/custom_form_field.dart';
import 'package:visitor_pass/views/widget/form_title.dart';

class VisitorCheckoutPageTablet extends StatelessWidget {
  VisitorCheckoutPageTablet({Key? key}) : super(key: key);
  final TextEditingController visitorIdController = TextEditingController();
  final CheckOutController checkOutController = Get.put(CheckOutController());
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
          body: GetBuilder<CheckOutController>(
              init: CheckOutController(),
              builder: (controller) {
                return Form(
                  key: _formKey,
                  child: Row(
                    children: [
                      SizedBox(
                        width: 60.w,
                      ),
                      Expanded(
                          flex: 1,
                          child: Column(
                            children: [
                              SizedBox(
                                height: 60.h,
                              ),
                              Row(
                                children: [
                                  IconButton(
                                    icon: Image.asset(Images.back),
                                    onPressed: () {
                                      Get.back();
                                    },
                                  ),
                                  SizedBox(
                                    width: 100.w,
                                  ),
                                  Text(
                                    'check_out'.tr,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 20.sp,
                                      color: AppColor.primaryColor,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 150.h,
                              ),
                              FormTitle(title: 'visitor_id'.tr),
                              CustomFormField(
                                controller: visitorIdController,
                                validatorTxt: 'enter_email_or_phone'.tr,
                                readOnly: false,
                              ),
                              SizedBox(
                                height: 34.h,
                              ),
                              SizedBox(
                                height: 48.h,
                                width: double.infinity,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      width: 140.w,
                                      height: 60.h,
                                      child: ElevatedButton(
                                        onPressed: () {
                                          validate = false;
                                          Get.back();
                                          (context as Element).markNeedsBuild();
                                        },
                                        style: ElevatedButton.styleFrom(
                                            foregroundColor:
                                                AppColor.primaryColor,
                                            backgroundColor:
                                                AppColor.borderColor,
                                            elevation: 0,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(24.r),
                                            )),
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
                                      width: 140.w,
                                      height: 60.h,
                                      child: ElevatedButton(
                                        onPressed: () {
                                          validateAndSave(context);
                                          (context as Element).markNeedsBuild();
                                        },
                                        style: ElevatedButton.styleFrom(
                                            foregroundColor: Colors.white,
                                            backgroundColor:
                                                AppColor.primaryColor,
                                            elevation: 0,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(24.r),
                                            )),
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
                          )),
                      SizedBox(
                        width: 50.w,
                      ),
                      Expanded(
                          flex: 1,
                          child: Stack(
                            children: [
                              SizedBox(
                                height: 60.h,
                              ),
                              Container(
                                height: 1100.h,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(Images.bg),
                                      fit: BoxFit.cover),
                                ),
                                child: Positioned(
                                  child: Padding(
                                    padding: EdgeInsets.only(top: 250.h),
                                    child: Text(
                                      'visitor_check_out'.tr,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 40.sp,
                                          fontWeight: FontWeight.w700,
                                          color: AppColor.primaryColor),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )),
                    ],
                  ),
                );
              }),
        );
      },
    );
  }

  void validateAndSave(context) {
    final FormState? form = _formKey.currentState;
    if (form!.validate()) {
      checkOutController.checkOutService(context, visitorIdController.text);
      validate = true;
    } else {
      validate = false;
    }
  }
}
