import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../constants/constants.dart';
import '../services/checkout_service.dart';

class CheckOutController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  bool loader = false;

  checkOutService(context, String visitorId) async {
    loader = true;
    update();
    var response = await CeckOutService.checkOutService(visitorId);
    if (response['data']['status'] == 200) {
      loader = false;
      update();
      Get.back();
      Get.rawSnackbar(
        snackPosition: SnackPosition.TOP,
        title: 'Check Out',
        message: response['data']['message'],
        backgroundColor: AppColor.greenColor.withOpacity(.9),
        maxWidth: ScreenSize(context!).mainWidth / 1.007,
        margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
      );
    } else if (response['data']['status'] == 404) {
      loader = false;
      update();
      Get.rawSnackbar(
        snackPosition: SnackPosition.TOP,
        title: 'Check Out Failed',
        message: response['data']['message'],
        backgroundColor: AppColor.redColor.withOpacity(.9),
        maxWidth: ScreenSize(context!).mainWidth / 1.007,
        margin: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
      );
    } else {
      loader = false;
      update();
      Get.rawSnackbar(
        snackPosition: SnackPosition.TOP,
        title: 'Check Out not successful!',
        message: 'Please enter valid input',
        backgroundColor: AppColor.redColor.withOpacity(.9),
        maxWidth: ScreenSize(context!).mainWidth / 1.007,
        margin: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
      );
    }
  }
}
