import 'package:flag/flag.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:visitor_pass/views/widget/home_widget.dart';
import '../../../constants/constants.dart';
import 'package:shimmer/shimmer.dart';

class HomeShimmer extends StatefulWidget {
  const HomeShimmer({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _HomeShimmerState();
  }
}

class _HomeShimmerState extends State<HomeShimmer> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20, top: 50),
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
                      child:  CircleAvatar(
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
            const SizedBox(
              height: 80,
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
              child:const Text(
                'Welcome, please tap on button to check-in',
                // ignore: prefer_const_constructors
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                  color: AppColor.gray,
                ),
              ),
            ),
            const SizedBox(height: 30),
            Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[400]!,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      HomeWidget(
                        color: const Color(0xffECF6FF),
                        image: "assets/home/Welcome.png",
                        text: 'visitor_checkin'.tr,
                        onTap: () {
                          
                        },
                      ),
                      SizedBox(width: 16.w),
                      HomeWidget(
                        color: const Color(0xffDFFEF3),
                        image: "assets/home/Calendar.png",
                        text: 'hape_appointment'.tr,
                        onTap: () {
                          
                        },
                      )
                    ],
                  ),
                  SizedBox(height: 16.h),
                  Row(
                    children: [
                      HomeWidget(
                        color: const Color(0xffFDFEDF),
                        image: "assets/home/Clock.png",
                        text: 'been_before'.tr,
                        onTap: () {
                          
                        },
                      ),
                      SizedBox(width: 16.w),
                      HomeWidget(
                        color: const Color(0xffE7FCFF),
                        image: "assets/home/QR Code.png",
                        text: 'Scan QR'.tr,
                        onTap: () {
                          
                        },
                      )
                    ],
                  ),
                  SizedBox(height: 16.h),
                  Row(
                    children: [
                      HomeWidget(
                        color: const Color(0xffF9F0FF),
                        image: "assets/home/Check Profile.png",
                        text: 'check_out'.tr,
                        onTap: () {
                          
                        },
                      ),
                    ],
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
