import 'package:flutter/material.dart';

import '../../constants/constants.dart';

class CustomFormNoValidatorField extends StatelessWidget {
  const CustomFormNoValidatorField({
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
        textInputAction: TextInputAction.done,
        maxLines: 4,
        keyboardType: TextInputType.multiline,
        cursorColor: AppColor.primaryColor,
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
}
