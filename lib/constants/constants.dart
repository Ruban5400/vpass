import 'package:flutter/cupertino.dart';
import 'package:get_storage/get_storage.dart';

final box = GetStorage();

class AppColor {
  static const Color primaryColor = Color(0xff002793);
  static const Color orangeColor = Color(0xffFF8269);
  static const Color greenColor = Color(0xff52BD70);
  static const Color borderColor = Color(0xffE3EBFF);
  static const Color violetColor = Color(0xff8157C6);
  static const Color hintColor = Color(0xff959CB1);
  static const Color nameColor = Color(0xff0A183F);
  static const Color redColor = Color(0xffDD2702);
  static const Color chekButtonColor = Color(0xffE93C3C);
  static const Color titleColor = Color(0xff0A183F);
  static const Color textButtonColor = Color(0xffEEF3FF);
  static const Color flagContainerColor = Color(0xffF4F7FF);
  static const Color gray = Color(0xff413F42);
  static const Color tackPhotoBg = Color(0xff030202);
  static const Color lightGray = Color(0xffDEE4F3);
}

class Images {
  static String get logo => 'assets/images/logo.png';
  static String get bg => 'assets/images/bg.png';
  static String get splashLogo => 'assets/images/splash_logo.png';
  static String get appIcon => 'assets/images/app_icon.png';
  static String get bell => 'assets/images/bell.png';
  static String get profile => 'assets/images/profile.png';
  static String get people => 'assets/images/people.png';
  static String get profile2 => 'assets/images/profile2.png';
  static String get location => 'assets/images/location.png';
  static String get nav1 => 'assets/images/nav1.png';
  static String get nav2 => 'assets/images/nav2.png';
  static String get nav3 => 'assets/images/nav3.png';
  static String get nav4 => 'assets/images/nav4.png';
  static String get nav5 => 'assets/images/nav5.png';
  static String get globe => 'assets/images/globe.png';
  static String get logout => 'assets/images/logout.png';
  static String get logoutIcon => 'assets/images/logout_icon.png';
  static String get back => 'assets/images/back.png';
  static String get bio => 'assets/images/bio.png';
  static String get visitor => 'assets/images/visitor.png';
  static String get translate => 'assets/images/translate.png';
  static String get cameraImage => 'assets/images/camera_shutter.png';
  static String get repeatImage => 'assets/images/refresh.png';
}

class ScreenSize {
  BuildContext context;
  ScreenSize(this.context);
  double get mainHeight => MediaQuery.of(context).size.height;
  double get mainWidth => MediaQuery.of(context).size.width;
  double get block => mainWidth / 100;
}
