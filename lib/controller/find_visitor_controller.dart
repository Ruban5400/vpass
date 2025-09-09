import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:visitor_pass/views/pages/beenBefore/tablet/been_before_visitor_first_page_tablet.dart';
import '../constants/constants.dart';
import '../services/find_visitor_service.dart';
import '../views/pages/beenBefore/mobile/been_before_visitor_first_page.dart';

class FindVisitorController extends GetxController {
  final TextEditingController findEmailController = TextEditingController();
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
  String fName = '';

  findVisitorPost(context) async {
    loader = true;
    update();
    var responseData =
        await FindVisitor().findVisitor(findEmailController.text);

    if (responseData == null) {
      loader = false;
      update();
      Get.rawSnackbar(
        snackPosition: SnackPosition.TOP,
        title: 'Visitor not found!',
        message: 'Please enter valid input',
        backgroundColor: AppColor.primaryColor.withOpacity(.9),
        maxWidth: ScreenSize(context!).mainWidth / 1.007,
        margin: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
      );
    } else if (responseData.status == 200) {
      findEmailController.text = '';
      firstNameController.text = responseData.visitor!.firstName!;
      lastNameController.text = responseData.visitor!.lastName!;
      emailController.text = responseData.visitor!.email == null
          ? ''
          : responseData.visitor!.email!;
      phoneController.text = responseData.visitor!.phone!;
      countryCodeController.text = responseData.visitor!.countryCode == null
          ? ''
          : responseData.visitor!.countryCode!;
      countryCodeNameController.text =
          responseData.visitor?.countryCodeName == null
              ? ''
              : responseData.visitor!.countryCodeName!;
      companyController.text = '';
      addressController.text = responseData.visitor!.address == null
          ? ''
          : responseData.visitor!.address!;
      nidController.text =
          responseData.visitor!.nationalIdentificationNo == null
              ? ''
              : responseData.visitor!.nationalIdentificationNo!;
      purposeController.text = '';
      loader = false;
      update();
      Get.to(() => box.read('isMobile')
          ? BeenBeforeVisitorDetailsFirstPage()
          : BeenBeforeVisitorDetailsFirstPageTablet());
    } else if (responseData.status == 404) {
      loader = false;
      update();
      Get.rawSnackbar(
        snackPosition: SnackPosition.TOP,
        title: 'Find Visitor',
        message: responseData.message,
        backgroundColor: AppColor.redColor.withOpacity(.9),
        maxWidth: ScreenSize(context!).mainWidth / 1.007,
        margin: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
      );
    }
  }
}
