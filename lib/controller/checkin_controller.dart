import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:visitor_pass/views/pages/checkin/mobile/visitor_checkin_page.dart';
import 'package:visitor_pass/views/pages/other/tablet/take_photo_page_tablet.dart';
import 'package:visitor_pass/views/pages/other/tablet/visitor_id_page_tablet.dart';

import '../constants/constants.dart';
import '../services/checkin_services.dart';
import '../views/pages/other/mobile/take_photo_page.dart';
import '../views/pages/other/mobile/visitor_id_page.dart';
import 'employee_controller.dart';

class CheckInController extends GetxController {
  final EmployeeController employeeController = Get.put(EmployeeController());
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController countryCodeController = TextEditingController();
  final TextEditingController countryCodeNameController =
      TextEditingController();
  final TextEditingController companyController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController purposeController = TextEditingController();
  final TextEditingController nidController = TextEditingController();
  late String genderID = "5";
  late String employeeID;
  bool loader = false;

  visitorPost(BuildContext? context, img, visitorData) async {
    loader = true;
    update();
    var response = await CheckInServices().visitorCheckInPost(visitorData, img);
    final responseBody = jsonDecode(await response.stream.bytesToString());
    print('5400 -=-=-=- >>> $responseBody');
    if (response.statusCode == 200) {
      loader = false;
      update();
      clearData();
      // Get.rawSnackbar(
      //   snackPosition: SnackPosition.TOP,
      //   title: 'Successful',
      //   message: 'Visitor created successfuly',
      //   backgroundColor: AppColor.primaryColor.withOpacity(.9),
      //   maxWidth: ScreenSize(context!).mainWidth / 1.007,
      //   margin: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
      // );
      if (context != null && context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text(
              'Visitor created successfully',
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: AppColor.primaryColor.withOpacity(.9),
            behavior: SnackBarBehavior.floating,
            margin: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
            duration: const Duration(seconds: 3),
          ),
        );
      }

      box.read('isMobile')
          ? Get.off(
              () => VisitorIdPage(visitorData: responseBody['data']['visitor']),
            )
          : Get.off(
              () => VisitorIdPageTablet(
                visitorData: responseBody['data']['visitor'],
              ),
            );
    } else if (responseBody['data']['status'] == 422) {
      loader = false;
      update();
      if (box.read('photoCaptureEnable') == "1") {
        Get.off(() => VisitorCheckInPage());
      }

      // Get.rawSnackbar(
      //   snackPosition: SnackPosition.TOP,
      //   title: 'Failed',
      //   message: responseBody['data']['message']['email'] != ''
      //       ? responseBody['data']['message']['email'].toString()
      //       : responseBody['data']['message']['phone'] != ''
      //           ? responseBody['data']['message']['phone']
      //           : '',
      //     // backgroundColor: Colors.black,
      //   backgroundColor: AppColor.redColor.withOpacity(.9),
      //   maxWidth: ScreenSize(context!).mainWidth / 1.007,
      //   margin: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
      // );
      if (context != null && context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              responseBody['data']['message']['email'] != ''
                  ? responseBody['data']['message']['email'].toString()
                  : responseBody['data']['message']['phone'] != ''
                  ? responseBody['data']['message']['phone']
                  : '',
              style: const TextStyle(color: Colors.white),
            ),
            backgroundColor: AppColor.redColor.withOpacity(.9),
            behavior: SnackBarBehavior.floating,
            margin: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
            duration: const Duration(seconds: 3),
          ),
        );
      }
    } else {
      loader = false;
      update();
      if (context != null && context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text(
              'Please enter valid input',
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: AppColor.primaryColor.withOpacity(.9),
            behavior: SnackBarBehavior.floating,
            margin: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
            duration: const Duration(seconds: 3),
          ),
        );
      }

      // Get.rawSnackbar(
      //   snackPosition: SnackPosition.TOP,
      //   title: 'Failed',
      //   message: 'Please enter valid input',
      //   backgroundColor: AppColor.primaryColor.withOpacity(.9),
      //   maxWidth: ScreenSize(context!).mainWidth / 1.007,
      //   margin: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
      // );
    }
  }

  visitorValidatePost(BuildContext? context, img, visitorData) async {
    loader = true;
    update();

    var response = await CheckInServices().visitorValidateCheckInPost(
      visitorData,
    );
    final responseBody = jsonDecode(await response.stream.bytesToString());
    print('5400 =-=-=- ${responseBody}');
    if (response.statusCode == 200) {
      loader = false;
      update();

      Get.off(
        () => box.read('isMobile')
            ? TakePhotoPage(visitorData: visitorData)
            : TakePhotoPageTablet(visitorData: visitorData),
      );
    } else if (responseBody['data']['status'] == 422) {
      loader = false;
      update();
      final messageMap = responseBody['data']['message'] as Map;
      if (context != null && context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(messageMap.values.first[0].toString()),
            backgroundColor: AppColor.redColor.withOpacity(.9),
            behavior: SnackBarBehavior.floating,
            margin: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
            duration: const Duration(seconds: 3),
          ),
        );
      }
      // Get.rawSnackbar(
      //   snackPosition: SnackPosition.TOP,
      //   title: 'Failed',
      //   message:messageMap.values.first[0].toString(),
      //   backgroundColor: AppColor.redColor.withOpacity(.9),
      //   maxWidth: ScreenSize(context!).mainWidth / 1.007,
      //   margin: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
      // );
    } else {
      loader = false;
      update();
      // Get.rawSnackbar(
      //   snackPosition: SnackPosition.TOP,
      //   title: 'Failed',
      //   message: 'Please enter valid input',
      //   backgroundColor: AppColor.primaryColor.withOpacity(.9),
      //   maxWidth: ScreenSize(context!).mainWidth / 1.007,
      //   margin: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
      // );
      if (context != null && context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Please enter valid input'),
            backgroundColor: AppColor.primaryColor.withOpacity(.9),
            behavior: SnackBarBehavior.floating,
            margin: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
            duration: const Duration(seconds: 3),
          ),
        );
      }
    }
  }

  clearData() {
    purposeController.text = '';
    firstNameController.text = '';
    lastNameController.text = '';
    emailController.text = '';
    phoneController.text = '';
    countryCodeController.text = '1';
    countryCodeNameController.text = 'us';
    companyController.text = '';
    addressController.text = '';
    nidController.text = '';
    employeeID = '';
    update();
  }
}
