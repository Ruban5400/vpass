import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({super.key, this.image, this.text, this.onTap, this.color});

  final String? image;
  final String? text;
  final void Function()? onTap;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 115.h,
        width: 152.w,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(12.r),
              child: Row(
                children: [Image.asset(image ?? "", height: 48.h, width: 48.w)],
              ),
            ),
            SizedBox(height: 12.h),
            Padding(
              padding: EdgeInsets.only(left: 12.w, right: 12.w),
              child: FittedBox(
                child: Text(
                  text ?? "",
                  style: GoogleFonts.epilogue(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xff0A183F),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
