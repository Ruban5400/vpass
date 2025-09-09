import 'package:flag/flag_enum.dart';
import 'package:flag/flag_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:visitor_pass/constants/constants.dart';
import 'package:visitor_pass/controller/appointment_controller.dart';
import 'package:visitor_pass/views/pages/appointment/tablet/appointment_page_tablet.dart';
import 'package:visitor_pass/views/pages/beenBefore/tablet/been_before_page_tablet.dart';
import 'package:visitor_pass/views/pages/checkin/tablet/visitor_checkin_first_page_tablet.dart';
import 'package:visitor_pass/views/pages/checkout/tablet/visitor_checkout_page_tablet.dart';
import 'package:visitor_pass/views/widget/shimmer/home_shimmer_tablet.dart';

import '../../../../controller/home_controller.dart';
import '../../../widget/custom_button.dart';
import '../mobile/qr_view_new.dart';

class HomePageTablet extends StatefulWidget {
  const HomePageTablet({super.key});

  @override
  State<HomePageTablet> createState() => _HomePageTabletState();
}

class _HomePageTabletState extends State<HomePageTablet> {
  String selectedValue = "English";
  final HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    if (box.read('selectedValue') != null) {
      selectedValue = box.read('selectedValue');
    }
    return ScreenUtilInit(
      designSize: const Size(1133, 744),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext context, Widget? child) {
        return Scaffold(
            backgroundColor: Colors.white,
            resizeToAvoidBottomInset: false,
            body: GetBuilder<HomeController>(
                init: HomeController(),
                builder: (home) {
                  return home.lodear
                      ? const HomeShimmerTablet()
                      : SingleChildScrollView(
                          physics: const NeverScrollableScrollPhysics(),
                          child: Padding(
                            padding: EdgeInsets.only(
                                left: 100.w, right: 100.w, top: 50.h),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                    child: Image(
                                        image: AssetImage(Images.logo))),
                                // Row(
                                //   mainAxisAlignment:
                                //       MainAxisAlignment.spaceBetween,
                                //   children: [
                                //     SizedBox(
                                //         child: Image(
                                //             image: AssetImage(Images.logo))),
                                //     Container(
                                //       height: 48.h,
                                //       width: 123.w,
                                //       decoration: BoxDecoration(
                                //           borderRadius:
                                //               BorderRadius.circular(20.r),
                                //           color: AppColor.flagContainerColor),
                                //       child: Row(
                                //         mainAxisAlignment:
                                //             MainAxisAlignment.center,
                                //         children: [
                                //           // ignore: prefer_const_constructors
                                //           PopupMenuButton(
                                //             padding: EdgeInsets.zero,
                                //             itemBuilder: (BuildContext bc) => [
                                //               PopupMenuItem(
                                //                 value: "en",
                                //                 child: Column(
                                //                   crossAxisAlignment:
                                //                       CrossAxisAlignment.start,
                                //                   children: [
                                //                     SizedBox(height: 10.h),
                                //                     Row(
                                //                       // ignore: prefer_const_literals_to_create_immutables
                                //                       children: [
                                //                         Flag.fromCode(
                                //                           FlagsCode.US,
                                //                           height: 20,
                                //                           width: 20,
                                //                         ),
                                //                         const SizedBox(
                                //                             width: 5.0),
                                //                         // ignore: prefer_const_constructors
                                //                         Text("English",
                                //                             style: TextStyle(
                                //                                 fontSize:
                                //                                     15.sp)),
                                //                       ],
                                //                     ),
                                //                   ],
                                //                 ),
                                //               ),
                                //               PopupMenuItem(
                                //                 value: "bn",
                                //                 child: Column(
                                //                   crossAxisAlignment:
                                //                       CrossAxisAlignment.start,
                                //                   children: [
                                //                     SizedBox(height: 10.h),
                                //                     Row(
                                //                       // ignore: prefer_const_literals_to_create_immutables
                                //                       children: [
                                //                         Flag.fromCode(
                                //                           FlagsCode.BD,
                                //                           height: 20.h,
                                //                           width: 20.w,
                                //                         ),
                                //                         SizedBox(width: 5.w),
                                //                         // ignore: prefer_const_constructors
                                //                         Text("Bangla",
                                //                             style: TextStyle(
                                //                                 fontSize:
                                //                                     15.sp)),
                                //                       ],
                                //                     ),
                                //                   ],
                                //                 ),
                                //               ),
                                //               PopupMenuItem(
                                //                 value: "de",
                                //                 child: Column(
                                //                   crossAxisAlignment:
                                //                       CrossAxisAlignment.start,
                                //                   children: [
                                //                     SizedBox(height: 10.h),
                                //                     Row(
                                //                       // ignore: prefer_const_literals_to_create_immutables
                                //                       children: [
                                //                         Flag.fromCode(
                                //                           FlagsCode.DE,
                                //                           height: 20.h,
                                //                           width: 20.w,
                                //                         ),
                                //                         SizedBox(width: 5.w),
                                //                         // ignore: prefer_const_constructors
                                //                         Text("German",
                                //                             style: TextStyle(
                                //                                 fontSize:
                                //                                     15.sp)),
                                //                       ],
                                //                     ),
                                //                   ],
                                //                 ),
                                //               ),
                                //               PopupMenuItem(
                                //                 value: "fr",
                                //                 child: Column(
                                //                   crossAxisAlignment:
                                //                       CrossAxisAlignment.start,
                                //                   children: [
                                //                     SizedBox(height: 10.h),
                                //                     Row(
                                //                       // ignore: prefer_const_literals_to_create_immutables
                                //                       children: [
                                //                         Flag.fromCode(
                                //                           FlagsCode.FR,
                                //                           height: 20.h,
                                //                           width: 20.w,
                                //                         ),
                                //                         SizedBox(width: 5.w),
                                //                         // ignore: prefer_const_constructors
                                //                         Text("France",
                                //                             style: TextStyle(
                                //                                 fontSize:
                                //                                     15.sp)),
                                //                       ],
                                //                     ),
                                //                   ],
                                //                 ),
                                //               ),
                                //               PopupMenuItem(
                                //                 value: "ar",
                                //                 child: Column(
                                //                   crossAxisAlignment:
                                //                       CrossAxisAlignment.start,
                                //                   children: [
                                //                     SizedBox(height: 10.h),
                                //                     Row(
                                //                       // ignore: prefer_const_literals_to_create_immutables
                                //                       children: [
                                //                         Flag.fromCode(
                                //                           FlagsCode.SA,
                                //                           height: 20.h,
                                //                           width: 20.w,
                                //                         ),
                                //                         SizedBox(width: 5.w),
                                //                         // ignore: prefer_const_constructors
                                //                         Text("Arabic",
                                //                             style: TextStyle(
                                //                                 fontSize:
                                //                                     15.sp)),
                                //                       ],
                                //                     ),
                                //                   ],
                                //                 ),
                                //               ),
                                //             ],
                                //             onSelected: (value) {
                                //               if (value == "en") {
                                //                 setState(() {
                                //                   box.write('lang', value);
                                //                   box.write('langKey', 'US');
                                //                   box.write('selectedValue',
                                //                       'English');
                                //                   Get.updateLocale(
                                //                       const Locale('en', 'US'));
                                //                 });
                                //               } else if (value == "bn") {
                                //                 setState(() {
                                //                   box.write('lang', value);
                                //                   box.write('langKey', 'BD');
                                //                   box.write('selectedValue',
                                //                       'Bangla');
                                //                   Get.updateLocale(
                                //                       const Locale('bn', 'BD'));
                                //                 });
                                //               } else if (value == "de") {
                                //                 setState(() {
                                //                   box.write('lang', value);
                                //                   box.write('langKey', 'DE');
                                //                   box.write('selectedValue',
                                //                       'German');
                                //                   Get.updateLocale(
                                //                       const Locale('de', 'DE'));
                                //                 });
                                //               } else if (value == "fr") {
                                //                 setState(() {
                                //                   box.write('lang', value);
                                //                   box.write('langKey', 'FR');
                                //                   box.write('selectedValue',
                                //                       'France');
                                //                   Get.updateLocale(
                                //                       const Locale('fr', 'FR'));
                                //                 });
                                //               } else if (value == "ar") {
                                //                 setState(() {
                                //                   box.write('lang', value);
                                //                   box.write('langKey', 'SA');
                                //                   box.write('selectedValue',
                                //                       'Arabic');
                                //                   Get.updateLocale(
                                //                       const Locale('ar', 'AR'));
                                //                 });
                                //               }
                                //             },
                                //             child: SizedBox(
                                //               height: 20.h,
                                //               width: 20.w,
                                //               child: CircleAvatar(
                                //                 child: Flag.fromString(
                                //                   box.read("langKey") ?? 'us',
                                //                   height: 18.h,
                                //                   width: 18.w,
                                //                   fit: BoxFit.cover,
                                //                   borderRadius: 50,
                                //                 ),
                                //               ),
                                //             ),
                                //           ),
                                //           SizedBox(
                                //             width: 10.w,
                                //           ),
                                //           Text(selectedValue.toString()),
                                //         ],
                                //       ),
                                //     ),
                                //   ],
                                // ),
                                SizedBox(
                                  height: 200.h,
                                ),
                                Text(
                                  home.settingsData.siteDescription.toString(),
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 60,
                                    color: AppColor.nameColor,
                                  ),
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                Text(
                                  home.settingsData.siteName.toString(),
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 24,
                                    color: AppColor.primaryColor,
                                  ),
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                Text(
                                  home.settingsData.welcomeScreen.toString(),
                                  // ignore: prefer_const_constructors
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 18,
                                    color: AppColor.gray,
                                  ),
                                ),
                                SizedBox(height: 30.h),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Row(
                                      children: [
                                        SizedBox(
                                          height: 70.h,
                                          width: 200.w,
                                          child: CustomButton(
                                            onPressed: () {
                                              Get.to(() =>
                                                  VisitorCheckInFirstPageTablet());
                                            },
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
                                            onPressed: () {
                                              Get.to(() =>
                                                  AppointmentPageTablet());
                                            },
                                            title: 'hape_appointment'.tr,
                                            primaryColor: Colors.white,
                                            onPrimaryColor:
                                                AppColor.primaryColor,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 24.w,
                                        ),
                                        SizedBox(
                                          height: 70.h,
                                          width: 200.w,
                                          child: CustomButton(
                                            onPressed: () {
                                              Get.to(
                                                  () => BeenBeforePageTablet());
                                            },
                                            primaryColor: Colors.white,
                                            onPrimaryColor:
                                                AppColor.primaryColor,
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
                                            onPressed: () {
                                              Get.to(() =>
                                                  VisitorCheckoutPageTablet());
                                            },
                                            style: ElevatedButton.styleFrom(
                                                elevation: 0,
                                                backgroundColor:
                                                    AppColor.chekButtonColor,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          50.r),
                                                )),
                                            child: Padding(
                                              padding: EdgeInsets.only(
                                                  left: 20.w, right: 15.w),
                                              child: Row(
                                                children: [
                                                  Image(
                                                    image: AssetImage(
                                                        Images.logout),
                                                    color: AppColor
                                                        .textButtonColor,
                                                    width: 20.w,
                                                    height: 20.h,
                                                  ),
                                                  SizedBox(
                                                    width: 10.w,
                                                  ),
                                                  Text(
                                                    'check_out'.tr,
                                                    style: TextStyle(
                                                      color: AppColor
                                                          .textButtonColor,
                                                      fontSize: 16.sp,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 70),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          SizedBox(
                                            height: 70.h,
                                            width: 200.w,
                                            child: CustomButton(
                                              onPressed: () {
                                                Get.to(
                                                    () => const QRViewExample(),
                                                    duration: const Duration(
                                                        milliseconds: 400),
                                                    transition:
                                                        Transition.rightToLeft);
                                                Get.put(
                                                    AppointmentController());
                                                Get.find<
                                                        AppointmentController>()
                                                    .requestCamerPermission();
                                              },
                                              primaryColor: Colors.white,
                                              onPrimaryColor:
                                                  AppColor.primaryColor,
                                              title: 'scan_qr'.tr,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                }));
      },
    );
  }
}
