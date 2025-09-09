// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:visitor_pass/controller/checkin_controller.dart';
import 'package:visitor_pass/controller/employee_controller.dart';
import 'package:visitor_pass/views/widget/non_required_form_filed.dart';
import '../../../../constants/constants.dart';
import '../../../widget/custom_email_field.dart';
import '../../../widget/custom_form_field.dart';
import '../../../widget/custom_form_field_not_validator.dart';
import '../../../widget/form_note_tile.dart';
import '../../../widget/form_title.dart';
import '../../../widget/form_title_nonrequired.dart';
import '../../../widget/loader.dart';

class VisitorCheckInPage extends StatefulWidget {
  VisitorCheckInPage({
    Key? key,
  }) : super(key: key);

  @override
  State<VisitorCheckInPage> createState() => _VisitorCheckInPageState();
}

class _VisitorCheckInPageState extends State<VisitorCheckInPage> {
  final EmployeeController employeeController = Get.put(EmployeeController());

  final CheckInController checkInController = Get.put(CheckInController());

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String countryCodeName = "in";
  String countryCode = "91";

//Gender Dropdown
  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      const DropdownMenuItem(
          child: Text(
            "Male",
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14,
              color: AppColor.titleColor,
            ),
          ),
          value: '5'),
      const DropdownMenuItem(
          child: Text(
            "Female",
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14,
              color: AppColor.titleColor,
            ),
          ),
          value: "10"),
    ];
    return menuItems;
  }

  bool validate = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'visitor_details'.tr,
          style: const TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 20,
            color: AppColor.primaryColor,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Image.asset(Images.back),
          onPressed: () {
            checkInController.clearData();
            Get.back();
          },
        ),
      ),
      body: GetBuilder<CheckInController>(
          init: CheckInController(),
          builder: (controller) {
            return Stack(
              children: [
                InkWell(
                  onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 15),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            FormTitle(title: 'first_name'.tr),
                            CustomFormField(
                              readOnly: false,
                              controller: checkInController.firstNameController,
                              validatorTxt: 'enter_first_name'.tr,
                            ),
                            FormTitle(title: 'last_name'.tr),
                            CustomFormField(
                              readOnly: false,
                              controller: checkInController.lastNameController,
                              validatorTxt: 'enter_last_name'.tr,
                            ),
                            FormTitle(title: 'email'.tr),
                            CustomEmailField(
                              controller: checkInController.emailController,
                              validatorTxt: 'enter_email'.tr,
                            ),
                            FormNoteTitle(title: 'phone'.tr),
                            IntlPhoneField(
                              controller: checkInController.phoneController,
                              keyboardType: TextInputType.number,
                              showDropdownIcon: false,
                              disableLengthCheck: true,
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.symmetric(
                                    vertical: 10.0, horizontal: 10.0),
                                errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                  borderSide: const BorderSide(
                                    width: 1,
                                    color: AppColor.redColor,
                                  ),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                  borderSide: const BorderSide(
                                    width: 1,
                                    color: AppColor.redColor,
                                  ),
                                ),
                                fillColor: Colors.red,
                                focusedBorder: const OutlineInputBorder(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(5),
                                      bottomLeft: Radius.circular(5)),
                                  borderSide: BorderSide(
                                      width: 1, color: AppColor.primaryColor),
                                ),
                                enabledBorder: const OutlineInputBorder(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(5),
                                    bottomLeft: Radius.circular(5),
                                    topRight: Radius.circular(5),
                                    bottomRight: Radius.circular(5),
                                  ),
                                  borderSide: BorderSide(
                                      width: 1, color: AppColor.borderColor),
                                ),
                              ),
                              initialCountryCode: countryCodeName.toUpperCase(),
                              onChanged: (phone) {
                                setState(() {
                                  countryCodeName =
                                      phone.countryISOCode.toLowerCase();
                                  countryCode =
                                      phone.countryCode.replaceAll('+', '');
                                });
                              },
                              onCountryChanged: (value) {
                                countryCode = value.dialCode;
                                countryCodeName = value.code.toLowerCase();
                              },
                            ),
                            FormTitle(title: 'select_gender'.tr),
                            dropdownItems.isEmpty
                                ? Container()
                                : Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 8.0),
                                    child: Container(
                                      height: 48,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          width: 1,
                                          color: AppColor.borderColor,
                                        ),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: ButtonTheme(
                                        alignedDropdown: true,
                                        child: DropdownButtonHideUnderline(
                                          child: DropdownButton(
                                              borderRadius:
                                                  const BorderRadius.all(
                                                      Radius.circular(10)),
                                              isExpanded: true,
                                              menuMaxHeight: ScreenSize(context)
                                                      .mainHeight /
                                                  3,
                                              items: dropdownItems,
                                              value: checkInController.genderID,
                                              onChanged: (String? newValue) {
                                                checkInController.genderID =
                                                    newValue!;
                                                (context as Element)
                                                    .markNeedsBuild();
                                              }),
                                        ),
                                      ),
                                    ),
                                  ),
                            NonRequiredFormTitle(title: 'your_company'.tr),
                            NonRequiredCustomFormField(
                              controller: checkInController.companyController,
                              validatorTxt: 'enter_company_name'.tr,
                            ),
                            FormTitle(title: 'enter_nid'.tr),
                            CustomFormField(
                              readOnly: false,
                              controller: checkInController.nidController,
                              validatorTxt: 'nid_no'.tr,
                            ),
                            NonRequiredFormTitle(title: 'address'.tr),
                            CustomFormNoValidatorField(
                              controller: checkInController.addressController,
                              validatorTxt: 'enter_address'.tr,
                            ),
                            const SizedBox(
                              height: 40,
                            ),
                            SizedBox(
                              height: 48,
                              width: double.infinity,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width: 126,
                                    height: 48,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        validate = false;
                                        Get.back();
                                        (context as Element).markNeedsBuild();
                                      },
                                      style: ElevatedButton.styleFrom(
                                          foregroundColor:
                                              AppColor.primaryColor,
                                          backgroundColor: AppColor.borderColor,
                                          elevation: 0,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          )),
                                      child: Text(
                                        'cancel'.tr,
                                        style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 50,
                                  ),
                                  SizedBox(
                                    width: 126,
                                    height: 48,
                                    child: ElevatedButton(
                                      onPressed: () async {
                                        validateAndSave(context);
                                        (context as Element).markNeedsBuild();
                                      },
                                      style: ElevatedButton.styleFrom(
                                          foregroundColor: Colors.white,
                                          backgroundColor:
                                              AppColor.primaryColor,
                                          elevation: 0,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          )),
                                      child: Text(
                                        'continue'.tr,
                                        style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                checkInController.loader
                    ? Positioned(
                        child: Container(
                          height: MediaQuery.of(context).size.height,
                          width: MediaQuery.of(context).size.width,
                          color: Colors.white60,
                          child: const Center(
                            child: Loader(),
                          ),
                        ),
                      )
                    : const SizedBox.shrink()
              ],
            );
          }),
    );
  }

  void validateAndSave(context) {
    final FormState? form = _formKey.currentState;
    if (form!.validate()) {
      Map<String, String> visitorData = {
        'first_name': checkInController.firstNameController.text,
        'last_name': checkInController.lastNameController.text,
        'email': checkInController.emailController.text,
        'phone': checkInController.phoneController.text,
        'country_code': countryCode,
        'country_code_name': countryCodeName,
        'company': checkInController.companyController.text,
        'address': checkInController.addressController.text,
        'purpose': checkInController.purposeController.text,
        'national_identification_no': checkInController.nidController.text,
        'employee_id': checkInController.employeeID.toString(),
        'gender': checkInController.genderID,
        'visitor_old': '0'
      };
      if (box.read('photoCaptureEnable') == "1") {
        checkInController.visitorValidatePost(context, '', visitorData);
        validate = true;
      } else {
        checkInController.visitorPost(context, '', visitorData);
        validate = true;
      }
    } else {
      validate = false;
    }
  }
}
