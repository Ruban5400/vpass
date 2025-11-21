import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import '../constants/constants.dart';
import '../services/appointment_services.dart';
import '../views/pages/appointment/mobile/appointment_visitor_first_page.dart';

class AppointmentController extends GetxController {
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
  late String employeeName;
  bool loader = false;

  void requestCamerPermission() async {
    var status = await Permission.camera.status;
    if (status.isGranted) {
    } else if (status.isDenied) {
      Permission.camera.request();
    }
  }

  qrcodeScan(bool qrcode, id, String type) {
    if (qrcode == true) {
      if (type == 'pre-registered') {
        findAppointmentForPreRegisterPost(id.toString());
      } else if (type == 'visitor-details') {
        findAppointmentForVisitorPost(id.toString());
      } else if (type == '') {
        findAppointmentPost(id.toString());
      }
    }
    if (qrcode == false) {
      findAppointmentPost(findEmailController.text);
    }
  }

  findAppointmentPost(id) async {
    loader = true;
    update();
    var responseData = await Appointment().findAppointment(id);
    if (responseData == null) {

      loader = false;
      update();
      Get.rawSnackbar(
        snackPosition: SnackPosition.TOP,
        title: 'Visitor not found!',
        message: 'Please enter valid input',
        backgroundColor: AppColor.primaryColor.withOpacity(.9),
        margin: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
      );
    } else if (responseData.status == 200) {
      findEmailController.text = '';
      firstNameController.text = responseData.visitor!.firstName!;
      lastNameController.text = responseData.visitor!.lastName!;
      emailController.text = responseData.visitor?.email == null
          ? ''
          : responseData.visitor!.email!;
      phoneController.text = responseData.visitor!.phone!;
      countryCodeController.text = responseData.visitor?.countryCode == null
          ? ''
          : responseData.visitor!.countryCode!;
      countryCodeNameController.text =
          responseData.visitor?.countryCodeName == null
              ? ''
              : responseData.visitor!.countryCodeName!;
      companyController.text = '';
      addressController.text = responseData.visitor?.address == null
          ? ''
          : responseData.visitor!.address!;
      nidController.text =
          responseData.visitor?.nationalIdentificationNo == null
              ? ''
              : responseData.visitor!.nationalIdentificationNo!;
      purposeController.text = '';
      employeeID = responseData.visitor!.employeeID.toString();
      employeeName = responseData.visitor!.employeeName.toString();
      loader = false;
      update();
      Get.to(() => box.read('isMobile')
          ? AppointmentVisitorFirstPage()
          : AppointmentVisitorFirstPage());
    } else if (responseData.status == 404) {
      print('5400 -=-=-= ');
      Get.rawSnackbar(
        snackPosition: SnackPosition.TOP,
        title: 'Find Visitor',
        message: responseData.message,
        backgroundColor: AppColor.redColor.withOpacity(.9),
        margin: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
      );
      loader = false;
      update();
    }
  }

  findAppointmentForPreRegisterPost(id) async {
    loader = true;
    update();
    var responseData = await Appointment().findAppointmentForPreRegister(id);
    if (responseData == null) {
      loader = false;
      update();
      Get.rawSnackbar(
        snackPosition: SnackPosition.TOP,
        title: 'Pre-registered not found!',
        message: 'Please enter valid input',
        backgroundColor: AppColor.primaryColor.withOpacity(.9),
        margin: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
      );
    } else if (responseData.status == 200) {
      findEmailController.text = '';
      firstNameController.text = responseData.visitor!.firstName!;
      lastNameController.text = responseData.visitor!.lastName!;
      emailController.text = responseData.visitor?.email == null
          ? ''
          : responseData.visitor!.email!;
      phoneController.text = responseData.visitor!.phone!;
      countryCodeController.text = responseData.visitor?.countryCode == null
          ? ''
          : responseData.visitor!.countryCode!;
      countryCodeNameController.text =
          responseData.visitor?.countryCodeName == null
              ? ''
              : responseData.visitor!.countryCodeName!;
      companyController.text = '';
      addressController.text = responseData.visitor?.address == null
          ? ''
          : responseData.visitor!.address!;
      nidController.text =
          responseData.visitor?.nationalIdentificationNo == null
              ? ''
              : responseData.visitor!.nationalIdentificationNo!;
      purposeController.text = '';
      employeeID = responseData.visitor!.employeeID.toString();
      employeeName = responseData.visitor!.employeeName.toString();
      loader = false;
      update();
      Get.to(() => box.read('isMobile')
          ? AppointmentVisitorFirstPage()
          : AppointmentVisitorFirstPage());
    } else if (responseData.status == 404) {
      Get.rawSnackbar(
        snackPosition: SnackPosition.TOP,
        title: 'Find Pre-registered',
        message: responseData.message,
        backgroundColor: AppColor.redColor.withOpacity(.9),
        margin: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
      );
      loader = false;
      update();
    }
  }

  findAppointmentForVisitorPost(id) async {
    loader = true;
    update();
    var responseData = await Appointment().findAppointmentForVisitor(id);
    if (responseData == null) {
      loader = false;
      update();
      Get.rawSnackbar(
        snackPosition: SnackPosition.TOP,
        title: 'Visitor not found!',
        message: 'Please enter valid input',
        backgroundColor: AppColor.primaryColor.withOpacity(.9),
        margin: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
      );
    } else if (responseData.status == 200) {
      findEmailController.text = '';
      firstNameController.text = responseData.visitor!.firstName!;
      lastNameController.text = responseData.visitor!.lastName!;
      emailController.text = responseData.visitor?.email == null
          ? ''
          : responseData.visitor!.email!;
      phoneController.text = responseData.visitor!.phone!;
      companyController.text = '';
      addressController.text = responseData.visitor?.address == null
          ? ''
          : responseData.visitor!.address!;
      nidController.text =
          responseData.visitor?.nationalIdentificationNo == null
              ? ''
              : responseData.visitor!.nationalIdentificationNo!;
      purposeController.text = '';
      employeeID = responseData.visitor!.employeeID.toString();
      employeeName = responseData.visitor!.employeeName.toString();
      loader = false;
      update();
      Get.to(() => box.read('isMobile')
          ? AppointmentVisitorFirstPage()
          : AppointmentVisitorFirstPage());
    } else if (responseData.status == 404) {
      Get.rawSnackbar(
        snackPosition: SnackPosition.TOP,
        title: 'Find Visitor',
        message: responseData.message,
        backgroundColor: AppColor.redColor.withOpacity(.9),
        margin: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
      );
      loader = false;
      update();
    }
  }
}
