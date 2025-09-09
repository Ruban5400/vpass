// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:visitor_pass/constants/constants.dart';
import 'package:visitor_pass/controller/find_visitor_controller.dart';
import 'package:visitor_pass/views/widget/custom_form_field.dart';
import 'package:visitor_pass/views/widget/form_title.dart';

import '../../../../constants/size_config_data.dart';
import '../../../widget/loader.dart';

class BeenBeforePage extends StatelessWidget {
  BeenBeforePage({Key? key}) : super(key: key);
  final FindVisitorController findVisitorController =
      Get.put(FindVisitorController());
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool validate = false;
  // ignore: prefer_typing_uninitialized_variables
  var mainHeight, mainWidth;
  @override
  Widget build(BuildContext context) {
    mainHeight = MediaQuery.of(context).size.height;
    mainWidth = MediaQuery.of(context).size.width;
    SizeConfigData sizeConfig = SizeConfigData();
    sizeConfig.init(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'been_before'.tr,
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
      body: GetBuilder<FindVisitorController>(
          init: FindVisitorController(),
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
                        const SizedBox(height: 8),
                        CustomFormField(
                          readOnly: false,
                          controller: findVisitorController.findEmailController,
                          validatorTxt: 'email_not_found'.tr,
                        ),
                        const SizedBox(
                          height: 42,
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
                findVisitorController.loader
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
      findVisitorController.findVisitorPost(context);
      validate = true;
    } else {
      validate = false;
    }
  }
}
