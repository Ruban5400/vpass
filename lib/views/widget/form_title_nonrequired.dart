import 'package:flutter/material.dart';

import '../../constants/constants.dart';

class NonRequiredFormTitle extends StatelessWidget {
  const NonRequiredFormTitle({
    Key? key,
    required this.title,
  }) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Row(
        children: [
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14,
              color: AppColor.titleColor,
            ),
          ),
        ],
      ),
    );
  }
}
