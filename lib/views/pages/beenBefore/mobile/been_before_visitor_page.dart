// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:visitor_pass/controller/checkin_controller.dart';
import 'package:visitor_pass/controller/employee_controller.dart';
import 'package:visitor_pass/controller/find_visitor_controller.dart';
import 'package:visitor_pass/views/widget/non_required_form_filed.dart';
import '../../../../constants/constants.dart';
import '../../../widget/custom_email_field.dart';
import '../../../widget/custom_form_field.dart';
import '../../../widget/custom_large_field_non_required.dart';
import '../../../widget/form_note_tile.dart';
import '../../../widget/form_title.dart';
import '../../../widget/form_title_nonrequired.dart';
import '../../../widget/loader.dart';

class BeenBeforeVisitorDetailsPage extends StatefulWidget {
  BeenBeforeVisitorDetailsPage({Key? key}) : super(key: key);

  @override
  State<BeenBeforeVisitorDetailsPage> createState() =>
      _BeenBeforeVisitorDetailsPageState();
}

class _BeenBeforeVisitorDetailsPageState
    extends State<BeenBeforeVisitorDetailsPage> {
  final FindVisitorController findVisitorController =
      Get.put(FindVisitorController());

  final CheckInController checkInController = Get.put(CheckInController());

  final EmployeeController employeeController = Get.put(EmployeeController());

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String countryCodeName = "in";
  String countryCode = "91";

  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(
          child: Text(
            "male".tr,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14,
              color: AppColor.titleColor,
            ),
          ),
          value: "Male"),
      DropdownMenuItem(
          child: Text(
            "female".tr,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14,
              color: AppColor.titleColor,
            ),
          ),
          value: "Female"),
    ];
    return menuItems;
  }

  int? selectedEmployee = 0;

  int? selectedEmployeeID;

  String selectedValue = "Male";

  bool validate = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: InkWell(
          onTap: () {},
          child: Text(
            'visitor_details'.tr,
            style: const TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 20,
              color: AppColor.primaryColor,
            ),
          ),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Image.asset(Images.back),
          onPressed: () {
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
                            readOnly: true,
                            controller:
                                findVisitorController.firstNameController,
                            validatorTxt: 'enter_first_name'.tr,
                          ),
                          FormTitle(title: 'last_name'.tr),
                          CustomFormField(
                            readOnly: true,
                            controller:
                                findVisitorController.lastNameController,
                            validatorTxt: 'enter_last_name'.tr,
                          ),
                          FormTitle(title: 'email'.tr),
                          CustomEmailField(
                            controller: findVisitorController.emailController,
                            validatorTxt: 'enter_email'.tr,
                          ),
                          FormNoteTitle(title: 'phone'.tr),
                          // CustomFormFieldNum(
                          //   readOnly: false,
                          //   controller: findVisitorController.phoneController,
                          //   validatorTxt: 'enter_phone_no'.tr,
                          // ),
                          IntlPhoneField(
                            controller: findVisitorController.phoneController,
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
                            initialCountryCode: findVisitorController
                                .countryCodeNameController.text
                                .toUpperCase(),
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
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8.0),
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
                                            menuMaxHeight:
                                                ScreenSize(context).mainHeight /
                                                    3,
                                            items: dropdownItems,
                                            value: selectedValue,
                                            onChanged: (String? newValue) {
                                              selectedValue = newValue!;
                                              (context as Element)
                                                  .markNeedsBuild();
                                            }),
                                      ),
                                    ),
                                  ),
                                ),
                          NonRequiredFormTitle(title: 'your_company'.tr),
                          NonRequiredCustomFormField(
                            controller: findVisitorController.companyController,
                            validatorTxt: 'enter_company_name'.tr,
                          ),
                          FormTitle(title: 'nid_no'.tr),
                          CustomFormField(
                            readOnly: true,
                            controller: findVisitorController.nidController,
                            validatorTxt: 'enter_nid'.tr,
                          ),
                          NonRequiredFormTitle(title: 'address'.tr),
                          CustomLargeFormNonRequired(
                            controller: findVisitorController.addressController,
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          SizedBox(
                            height: 48,
                            width: double.infinity,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                        foregroundColor: AppColor.primaryColor,
                                        backgroundColor: AppColor.borderColor,
                                        elevation: 0,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5),
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
                                    onPressed: () {
                                      validateAndSave(context);
                                      (context as Element).markNeedsBuild();
                                    },
                                    style: ElevatedButton.styleFrom(
                                        foregroundColor: Colors.white,
                                        backgroundColor: AppColor.primaryColor,
                                        elevation: 0,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5),
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
        },
      ),
    );
  }

  void validateAndSave(context) {
    final FormState? form = _formKey.currentState;
    if (form!.validate()) {
      Map<String, String> visitorData = {
        'first_name': findVisitorController.firstNameController.text,
        'last_name': findVisitorController.lastNameController.text,
        'email': findVisitorController.emailController.text,
        'phone': findVisitorController.phoneController.text,
        'country_code': countryCode,
        'country_code_name': countryCodeName,
        'company': findVisitorController.companyController.text,
        'address': findVisitorController.addressController.text,
        'purpose': findVisitorController.purposeController.text,
        'national_identification_no': findVisitorController.nidController.text,
        'employee_id': findVisitorController.employeeID.toString(),
        'gender': findVisitorController.genderID,
        'visitor_old': '1'
      };

      if (box.read('photoCaptureEnable') == "1") {
        checkInController.visitorValidatePost(context, '', visitorData);
        // Get.off(() => TakePhotoPage(visitorData: visitorData));
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
