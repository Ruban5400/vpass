import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.title,
    required this.onPressed,
    required this.primaryColor,
    required this.onPrimaryColor,
  }) : super(key: key);
  final String title;
  final VoidCallback onPressed;
  final Color primaryColor;
  final Color onPrimaryColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Center(
        child: SizedBox(
          height: 48.h,
          width: 320.w,
          child: ElevatedButton(
            onPressed: onPressed,
            child: Text(
              title,
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            style: ElevatedButton.styleFrom(
                foregroundColor: onPrimaryColor,
                backgroundColor: primaryColor,
                elevation: 0,
                side: BorderSide(width: 1.w, color: onPrimaryColor),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50.r),
                )),
          ),
        ),
      ),
    );
  }
}
