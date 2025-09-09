import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constants/constants.dart';

class CustomEmailField extends StatelessWidget {
  const CustomEmailField({
    Key? key,
    required this.controller,
    required this.validatorTxt,
  }) : super(key: key);

  final TextEditingController controller;
  final String validatorTxt;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        controller: controller,
        textInputAction: TextInputAction.next,
        keyboardType: TextInputType.text,
        cursorColor: AppColor.primaryColor,
        validator: (value) => value != null && !EmailValidator.validate(value)
            ? "Enter Valid Email"
            : null,
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(
              width: 1,
              color: AppColor.redColor,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(
              width: 1,
              color: AppColor.redColor,
            ),
          ),
          fillColor: Colors.red,
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(width: 1, color: AppColor.primaryColor),
          ),
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(width: 1, color: AppColor.borderColor),
          ),
        ),
        onFieldSubmitted: (value) {
          //add code
        },
      ),
    );
  }

  showMessage(context) {
    Get.rawSnackbar(
      snackPosition: SnackPosition.TOP,
      title: 'Email',
      message: 'Please enter valid email!',
      backgroundColor: AppColor.redColor,
      maxWidth: ScreenSize(context!).mainWidth / 1.007,
      margin: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
    );
  }
}
