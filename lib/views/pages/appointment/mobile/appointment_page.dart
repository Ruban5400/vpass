// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:visitor_pass/constants/constants.dart';
import 'package:visitor_pass/controller/appointment_controller.dart';
import 'package:visitor_pass/views/widget/custom_form_field.dart';
import 'package:visitor_pass/views/widget/form_title.dart';
import 'package:visitor_pass/views/widget/loader.dart';

class AppointmentPage extends StatelessWidget {
  AppointmentPage({Key? key}) : super(key: key);
  final AppointmentController appointmentController =
      Get.put(AppointmentController());

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool validate = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'have_appointment'.tr,
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
      body: GetBuilder<AppointmentController>(
          init: AppointmentController(),
          builder: (controller) {
            return Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 35.0, horizontal: 20),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        FormTitle(title: 'visitor_email_phone'.tr),
                        CustomFormField(
                          readOnly: false,
                          controller: appointmentController.findEmailController,
                          validatorTxt: 'enter_email_or_phone'.tr,
                        ),
                        const SizedBox(
                          height: 34,
                        ),
                        SizedBox(
                          height: 48,
                          width: double.infinity,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: 126,
                                height: 48,
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
                                        borderRadius: BorderRadius.circular(10),
                                      )),
                                  child: Text(
                                    'cancel'.tr,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 50,
                              ),
                              SizedBox(
                                width: 126,
                                height: 48,
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
                                        borderRadius: BorderRadius.circular(10),
                                      )),
                                  child: Text(
                                    'continue'.tr,
                                    style: const TextStyle(
                                      fontSize: 16,
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
                ),
                appointmentController.loader
                    ? Positioned(
                        child: Container(
                          height: MediaQuery.of(context).size.height,
                          width: MediaQuery.of(context).size.width,
                          color: Colors.white60,
                          child: const Center(
                            child: Loader(),
                          ),
                        ),
                      )
                    : const SizedBox.shrink(),
              ],
            );
          }),
    );
  }

  void validateAndSave(context) {
    final FormState? form = _formKey.currentState;
    if (form!.validate()) {
      FocusManager.instance.primaryFocus?.unfocus();
      appointmentController.qrcodeScan(false, '','');
      validate = true;
    } else {
      validate = false;
    }
  }
}
