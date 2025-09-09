import 'package:flutter/material.dart';

import '../../constants/constants.dart';

class CustomFormField extends StatelessWidget {
  const CustomFormField({
    Key? key,
    required this.controller,
    required this.validatorTxt,
    required this.readOnly,
  }) : super(key: key);

  final TextEditingController controller;
  final String validatorTxt;
  final bool readOnly;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        readOnly: readOnly,
        controller: controller,
        textInputAction: TextInputAction.next,
        keyboardType: TextInputType.text,
        cursorColor: AppColor.primaryColor,
        validator: (value) => value!.isEmpty ? validatorTxt : null,
        decoration: InputDecoration(
          filled: readOnly,
          fillColor: AppColor.lightGray,
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
          focusedBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(
                width: 1,
                color: readOnly ? AppColor.lightGray : AppColor.primaryColor),
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
}
