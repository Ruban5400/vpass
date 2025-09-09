import 'package:flag/flag.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

import '../../../constants/constants.dart';
import '../custom_button.dart';

class HomeShimmerTablet extends StatefulWidget {
  const HomeShimmerTablet({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _HomeShimmerTabletState();
  }
}

class _HomeShimmerTabletState extends State<HomeShimmerTablet> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: Padding(
        padding: EdgeInsets.only(left: 100.w, right: 100.w, top: 50.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image(image: AssetImage(Images.logo)),
                Row(
                  children: [
                    Text(''.tr),
                    // ignore: prefer_const_constructors
                    SizedBox(
                      width: 10,
                    ),
                    const SizedBox(
                      height: 32,
                      width: 32,
                      child: CircleAvatar(
                        child: Flag.fromString(
                          'us',
                          height: 30,
                          width: 30,
                          fit: BoxFit.cover,
                          borderRadius: 50,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 200.h,
            ),
            Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[400]!,
              child: const Text(
                'Visitor Pass Management System',
                // ignore: prefer_const_constructors
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 30,
                  color: AppColor.primaryColor,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[400]!,
              child: const Text(
                'Comapany Name',
                // ignore: prefer_const_constructors
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 24,
                  color: AppColor.primaryColor,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[400]!,
              child: const Text(
                'Welcome, please tap on button to check-in',
                // ignore: prefer_const_constructors
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                  color: AppColor.gray,
                ),
              ),
            ),
            const SizedBox(height: 60),
            Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[400]!,
              child: Row(
                children: [
                  SizedBox(
                    height: 70.h,
                    width: 200.w,
                    child: CustomButton(
                      onPressed: () {},
                      title: 'visitor_checkin'.tr,
                      primaryColor: AppColor.primaryColor,
                      onPrimaryColor: Colors.white,
                    ),
                  ),
                  SizedBox(
                    width: 24.w,
                  ),
                  SizedBox(
                    height: 70.h,
                    width: 200.w,
                    child: CustomButton(
                      onPressed: () {},
                      title: 'hape_appointment'.tr,
                      primaryColor: Colors.white,
                      onPrimaryColor: AppColor.primaryColor,
                    ),
                  ),
                  SizedBox(
                    width: 24.w,
                  ),
                  SizedBox(
                    height: 70.h,
                    width: 200.w,
                    child: CustomButton(
                      onPressed: () {},
                      primaryColor: Colors.white,
                      onPrimaryColor: AppColor.primaryColor,
                      title: 'been_before'.tr,
                    ),
                  ),
                  SizedBox(
                    width: 24.w,
                  ),
                  SizedBox(
                    height: 45.h,
                    width: 200.w,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Padding(
                        padding: EdgeInsets.only(left: 20.w, right: 15.w),
                        child: Row(
                          children: [
                            Image(
                              image: AssetImage(Images.logout),
                              color: AppColor.textButtonColor,
                              width: 20.w,
                              height: 20.h,
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            Text(
                              'check_out'.tr,
                              style: TextStyle(
                                color: AppColor.textButtonColor,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                          elevation: 0,
                          backgroundColor: AppColor.chekButtonColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50.r),
                          )),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
