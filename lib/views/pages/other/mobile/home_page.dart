import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:visitor_pass/constants/constants.dart';
import 'package:get/get.dart';
import 'package:visitor_pass/controller/appointment_controller.dart';
import 'package:visitor_pass/controller/home_controller.dart';
import 'package:visitor_pass/views/pages/beenBefore/mobile/been_before_page.dart';
import 'package:visitor_pass/views/pages/checkout/mobile/visitor_checkout_page.dart';
import 'package:visitor_pass/views/widget/home_widget.dart';
import 'package:visitor_pass/views/widget/shimmer/home_shimmer.dart';
import '../../appointment/mobile/appointment_page.dart';
import 'package:flag/flag.dart';

import '../../checkin/mobile/visitor_checkin_first_page.dart';
import 'qr_view_new.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);
  final GlobalKey qrKey = GlobalKey();

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String selectedValue = "English";
  final HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    if (box.read('selectedValue') != null) {
      selectedValue = box.read('selectedValue');
    }
    return Scaffold(
      backgroundColor: Colors.white,
      body: GetBuilder<HomeController>(
        init: HomeController(),
        builder: (home) {
          return home.lodear
              ? const HomeShimmer()
              : Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20, top: 50),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image(image: AssetImage(Images.logo),width: 75,),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //   children: [
                    //     Image(image: AssetImage(Images.logo),width: 75,),
                    //     Row(
                    //       children: [
                    //         Text(selectedValue.toString()),
                    //         // ignore: prefer_const_constructors
                    //         SizedBox(width: 10),
                    //         PopupMenuButton(
                    //           child: SizedBox(
                    //             height: 32,
                    //             width: 32,
                    //             child: CircleAvatar(
                    //               child: Flag.fromString(
                    //                 box.read("langKey") ?? 'us',
                    //                 height: 30,
                    //                 width: 30,
                    //                 fit: BoxFit.cover,
                    //                 borderRadius: 50,
                    //               ),
                    //             ),
                    //           ),
                    //           padding: EdgeInsets.zero,
                    //           itemBuilder:
                    //               (BuildContext bc) => [
                    //                 PopupMenuItem(
                    //                   value: "en",
                    //                   child: Column(
                    //                     crossAxisAlignment:
                    //                         CrossAxisAlignment.start,
                    //                     children: [
                    //                       const SizedBox(height: 10.0),
                    //                       Row(
                    //                         // ignore: prefer_const_literals_to_create_immutables
                    //                         children: [
                    //                           Flag.fromCode(
                    //                             FlagsCode.US,
                    //                             height: 20,
                    //                             width: 20,
                    //                           ),
                    //                           const SizedBox(width: 5.0),
                    //                           // ignore: prefer_const_constructors
                    //                           Text(
                    //                             "English",
                    //                             style: const TextStyle(
                    //                               fontSize: 15,
                    //                             ),
                    //                           ),
                    //                         ],
                    //                       ),
                    //                     ],
                    //                   ),
                    //                 ),
                    //                 PopupMenuItem(
                    //                   value: "bn",
                    //                   child: Column(
                    //                     crossAxisAlignment:
                    //                         CrossAxisAlignment.start,
                    //                     children: [
                    //                       const SizedBox(height: 10.0),
                    //                       Row(
                    //                         // ignore: prefer_const_literals_to_create_immutables
                    //                         children: [
                    //                           Flag.fromCode(
                    //                             FlagsCode.BD,
                    //                             height: 20,
                    //                             width: 20,
                    //                           ),
                    //                           const SizedBox(width: 5.0),
                    //                           // ignore: prefer_const_constructors
                    //                           Text(
                    //                             "Bangla",
                    //                             style: const TextStyle(
                    //                               fontSize: 15,
                    //                             ),
                    //                           ),
                    //                         ],
                    //                       ),
                    //                     ],
                    //                   ),
                    //                 ),
                    //                 PopupMenuItem(
                    //                   value: "de",
                    //                   child: Column(
                    //                     crossAxisAlignment:
                    //                         CrossAxisAlignment.start,
                    //                     children: [
                    //                       const SizedBox(height: 10.0),
                    //                       Row(
                    //                         // ignore: prefer_const_literals_to_create_immutables
                    //                         children: [
                    //                           Flag.fromCode(
                    //                             FlagsCode.DE,
                    //                             height: 20,
                    //                             width: 20,
                    //                           ),
                    //                           const SizedBox(width: 5.0),
                    //                           // ignore: prefer_const_constructors
                    //                           Text(
                    //                             "German",
                    //                             style: const TextStyle(
                    //                               fontSize: 15,
                    //                             ),
                    //                           ),
                    //                         ],
                    //                       ),
                    //                     ],
                    //                   ),
                    //                 ),
                    //                 PopupMenuItem(
                    //                   value: "fr",
                    //                   child: Column(
                    //                     crossAxisAlignment:
                    //                         CrossAxisAlignment.start,
                    //                     children: [
                    //                       const SizedBox(height: 10.0),
                    //                       Row(
                    //                         // ignore: prefer_const_literals_to_create_immutables
                    //                         children: [
                    //                           Flag.fromCode(
                    //                             FlagsCode.FR,
                    //                             height: 20,
                    //                             width: 20,
                    //                           ),
                    //                           const SizedBox(width: 5.0),
                    //                           // ignore: prefer_const_constructors
                    //                           Text(
                    //                             "France",
                    //                             style: const TextStyle(
                    //                               fontSize: 15,
                    //                             ),
                    //                           ),
                    //                         ],
                    //                       ),
                    //                     ],
                    //                   ),
                    //                 ),
                    //                 PopupMenuItem(
                    //                   value: "ar",
                    //                   child: Column(
                    //                     crossAxisAlignment:
                    //                         CrossAxisAlignment.start,
                    //                     children: [
                    //                       const SizedBox(height: 10.0),
                    //                       Row(
                    //                         // ignore: prefer_const_literals_to_create_immutables
                    //                         children: [
                    //                           Flag.fromCode(
                    //                             FlagsCode.SA,
                    //                             height: 20,
                    //                             width: 20,
                    //                           ),
                    //                           const SizedBox(width: 5.0),
                    //                           // ignore: prefer_const_constructors
                    //                           Text(
                    //                             "Arabic",
                    //                             style: const TextStyle(
                    //                               fontSize: 15,
                    //                             ),
                    //                           ),
                    //                         ],
                    //                       ),
                    //                     ],
                    //                   ),
                    //                 ),
                    //               ],
                    //           onSelected: (value) {
                    //             if (value == "en") {
                    //               setState(() {
                    //                 box.write('lang', value);
                    //                 box.write('langKey', 'US');
                    //                 box.write('selectedValue', 'English');
                    //                 Get.updateLocale(const Locale('en', 'US'));
                    //               });
                    //             } else if (value == "bn") {
                    //               setState(() {
                    //                 box.write('lang', value);
                    //                 box.write('langKey', 'BD');
                    //                 box.write('selectedValue', 'Bangla');
                    //                 Get.updateLocale(const Locale('bn', 'BD'));
                    //               });
                    //             } else if (value == "de") {
                    //               setState(() {
                    //                 box.write('lang', value);
                    //                 box.write('langKey', 'DE');
                    //                 box.write('selectedValue', 'German');
                    //                 Get.updateLocale(const Locale('de', 'DE'));
                    //               });
                    //             } else if (value == "fr") {
                    //               setState(() {
                    //                 box.write('lang', value);
                    //                 box.write('langKey', 'FR');
                    //                 box.write('selectedValue', 'France');
                    //                 Get.updateLocale(const Locale('fr', 'FR'));
                    //               });
                    //             } else if (value == "ar") {
                    //               setState(() {
                    //                 box.write('lang', value);
                    //                 box.write('langKey', 'SA');
                    //                 box.write('selectedValue', 'Arabic');
                    //                 Get.updateLocale(const Locale('ar', 'AR'));
                    //               });
                    //             }
                    //           },
                    //         ),
                    //       ],
                    //     ),
                    //   ],
                    // ),
                    const SizedBox(height: 20),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            const SizedBox(height: 20),
                            Text(
                              home.settingsData.siteDescription.toString(),
                              // ignore: prefer_const_constructors
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 30,
                                color: AppColor.primaryColor,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              home.settingsData.siteName.toString(),
                              // ignore: prefer_const_constructors
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 24,
                                color: AppColor.primaryColor,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              home.settingsData.welcomeScreen.toString(),
                              // ignore: prefer_const_constructors
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 18,
                                color: AppColor.gray,
                              ),
                            ),
                            const SizedBox(height: 30),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Row(
                                  children: [
                                    HomeWidget(
                                      color: const Color(0xffECF6FF),
                                      image: "assets/home/Welcome.png",
                                      text: 'visitor_checkin'.tr,
                                      onTap: () {
                                        Get.to(
                                          () => VisitorCheckInFirstPage(),
                                          duration: const Duration(
                                            milliseconds: 400,
                                          ),
                                          transition: Transition.rightToLeft,
                                        );
                                      },
                                    ),
                                    SizedBox(width: 16.w),
                                    HomeWidget(
                                      color: const Color(0xffDFFEF3),
                                      image: "assets/home/Calendar.png",
                                      text: 'hape_appointment'.tr,
                                      onTap: () {
                                        Get.to(
                                          () => AppointmentPage(),
                                          duration: const Duration(
                                            milliseconds: 400,
                                          ),
                                          transition: Transition.rightToLeft,
                                        );
                                      },
                                    ),
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
                                        Get.to(
                                          () => BeenBeforePage(),
                                          duration: const Duration(
                                            milliseconds: 400,
                                          ),
                                          transition: Transition.rightToLeft,
                                        );
                                      },
                                    ),
                                    SizedBox(width: 16.w),
                                    HomeWidget(
                                      color: const Color(0xffE7FCFF),
                                      image: "assets/home/QR Code.png",
                                      text: 'Scan QR'.tr,
                                      onTap: () {
                                        Get.put(AppointmentController());
                                        Get.find<AppointmentController>()
                                            .requestCamerPermission();
                                        Get.to(const QRViewExample());
                                      },
                                    ),
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
                                        Get.to(
                                          () => VisitorCheckoutPage(),
                                          duration: const Duration(
                                            milliseconds: 400,
                                          ),
                                          transition: Transition.rightToLeft,
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(height: 30.h),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
        },
      ),
    );
  }
}
