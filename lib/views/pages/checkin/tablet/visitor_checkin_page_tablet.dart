// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:visitor_pass/controller/checkin_controller.dart';
import 'package:visitor_pass/controller/employee_controller.dart';

import '../../../../constants/constants.dart';
import '../../../widget/custom_email_field.dart';
import '../../../widget/custom_form_field.dart';
import '../../../widget/custom_form_field_not_validator.dart';
import '../../../widget/form_note_tile.dart';
import '../../../widget/form_title.dart';
import '../../../widget/form_title_nonrequired.dart';
import '../../../widget/loader.dart';
import '../../../widget/non_required_form_filed.dart';

class VisitorCheckInPageTablet extends StatefulWidget {
  VisitorCheckInPageTablet({
    Key? key,
  }) : super(key: key);

  @override
  State<VisitorCheckInPageTablet> createState() =>
      _VisitorCheckInPageTabletState();
}

class _VisitorCheckInPageTabletState extends State<VisitorCheckInPageTablet> {
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
      DropdownMenuItem(
          child: Text(
            "Female",
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14.sp,
              color: AppColor.titleColor,
            ),
          ),
          value: "10"),
    ];
    return menuItems;
  }

  bool validate = false;

  int? selectedEmployee = 0;

  int? selectedEmployeeID;

  double heightEmployee = 60;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Center(
          child: Text(
            'visitor_details'.tr,
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 20.sp,
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
            checkInController.clearData();
            Get.back();
          },
        ),
      ),
      body: GetBuilder<CheckInController>(
          init: CheckInController(),
          builder: (controller) {
            return SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  InkWell(
                    onTap: () =>
                        FocusManager.instance.primaryFocus?.unfocus(),
                    child: Form(
                      key: _formKey,
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: 120.w, right: 120.w, top: 36.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 1,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  FormTitle(title: 'first_name'.tr),
                                  CustomFormField(
                                    readOnly: false,
                                    controller:
                                        checkInController.firstNameController,
                                    validatorTxt: 'enter_first_name'.tr,
                                  ),
                                  FormTitle(title: 'email'.tr),
                                  CustomEmailField(
                                    controller:
                                        checkInController.emailController,
                                    validatorTxt: 'enter_email'.tr,
                                  ),
                                  FormTitle(title: 'select_gender'.tr),
                                  dropdownItems.isEmpty
                                      ? Container()
                                      : Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 8.h),
                                          child: Container(
                                            height: 48.h,
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                width: 1.w,
                                                color: AppColor.borderColor,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(10.r),
                                            ),
                                            child: ButtonTheme(
                                              alignedDropdown: true,
                                              child:
                                                  DropdownButtonHideUnderline(
                                                child: DropdownButton(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                10.r)),
                                                    isExpanded: true,
                                                    menuMaxHeight:
                                                        ScreenSize(context)
                                                                .mainHeight /
                                                            3,
                                                    items: dropdownItems,
                                                    value: checkInController
                                                        .genderID,
                                                    onChanged:
                                                        (String? newValue) {
                                                      checkInController
                                                              .genderID =
                                                          newValue!;
                                                      (context as Element)
                                                          .markNeedsBuild();
                                                    }),
                                              ),
                                            ),
                                          ),
                                        ),
                                  FormTitle(title: 'enter_nid'.tr),
                                  CustomFormField(
                                    readOnly: false,
                                    controller:
                                        checkInController.nidController,
                                    validatorTxt: 'nid_no'.tr,
                                  ),
                                  // FormTitle(title: 'select_employee'.tr),
                                  // GetBuilder<EmployeeController>(
                                  //     init: EmployeeController(),
                                  //     builder: (controller) {
                                  //       return Container(
                                  //         child: controller.employeeList.isEmpty
                                  //             ? Container(
                                  //                 height: 50,
                                  //                 color: Colors.white,
                                  //                 child: Center(
                                  //                     child: Text(
                                  //                   'no_data_found'.tr,
                                  //                   style: const TextStyle(
                                  //                       color: Colors.red),
                                  //                 )),
                                  //               )
                                  //             : Padding(
                                  //                 padding: const EdgeInsets.only(
                                  //                     top: 10),
                                  //                 child: SizedBox(
                                  //                   height: heightEmployee,
                                  //                   width: double.infinity,
                                  //                   child: DropdownSearch(
                                  //                     //mode of dropdown
                                  //                     dropdownSearchDecoration:
                                  //                         // ignore: prefer_const_constructors
                                  //                         InputDecoration(
                                  //                       contentPadding:
                                  //                           const EdgeInsets
                                  //                                   .symmetric(
                                  //                               vertical: 10.0,
                                  //                               horizontal: 10.0),
                                  //                       errorBorder:
                                  //                           OutlineInputBorder(
                                  //                         borderRadius:
                                  //                             BorderRadius
                                  //                                 .circular(10.0),
                                  //                         borderSide:
                                  //                             const BorderSide(
                                  //                           width: 1,
                                  //                           color:
                                  //                               AppColor.redColor,
                                  //                         ),
                                  //                       ),
                                  //                       focusedErrorBorder:
                                  //                           OutlineInputBorder(
                                  //                         borderRadius:
                                  //                             BorderRadius
                                  //                                 .circular(10.0),
                                  //                         borderSide:
                                  //                             const BorderSide(
                                  //                           width: 1,
                                  //                           color:
                                  //                               AppColor.redColor,
                                  //                         ),
                                  //                       ),
                                  //                       fillColor: Colors.red,
                                  //                       focusedBorder:
                                  //                           const OutlineInputBorder(
                                  //                         borderRadius:
                                  //                             BorderRadius.all(
                                  //                                 Radius.circular(
                                  //                                     10)),
                                  //                         borderSide: BorderSide(
                                  //                             width: 1,
                                  //                             color: AppColor
                                  //                                 .primaryColor),
                                  //                       ),
                                  //                       enabledBorder:
                                  //                           const OutlineInputBorder(
                                  //                         borderRadius:
                                  //                             BorderRadius.all(
                                  //                                 Radius.circular(
                                  //                                     10)),
                                  //                         borderSide: BorderSide(
                                  //                             width: 1,
                                  //                             color: AppColor
                                  //                                 .borderColor),
                                  //                       ),
                                  //                     ),
                                  //                     mode: Mode.MENU,
                                  //                     showSearchBox: true,
                                  //                     items: controller
                                  //                         .employeeList
                                  //                         .map((EmployeeData
                                  //                             value) {
                                  //                       return value.name
                                  //                           .toString();
                                  //                     }).toList(),
                                  //                     onChanged: (employeeName) {
                                  //                       EmployeeData employee =
                                  //                           controller
                                  //                               .employeeList
                                  //                               .where((data) =>
                                  //                                   data.name ==
                                  //                                   employeeName)
                                  //                               .toList()
                                  //                               .first;
                                  //                       selectedEmployeeID =
                                  //                           employee.id;
                                  //                       checkInController
                                  //                               .employeeID =
                                  //                           employee.id!
                                  //                               .toString();
                                  //                       (context as Element)
                                  //                           .markNeedsBuild();
                                  //                     },
                                  //                     validator: (String?
                                  //                         selectedEmployeeID) {
                                  //                       if (selectedEmployeeID ==
                                  //                           null) {
                                  //                         heightEmployee = 83;
                                  //                         (context as Element)
                                  //                             .markNeedsBuild();
                                  //                         return 'choose_employee'
                                  //                             .tr;
                                  //                       } else {
                                  //                         return null;
                                  //                       }
                                  //                     },
                                  //                   ),
                                  //                 ),
                                  //               ),
                                  //       );
                                  //     }),
                                  SizedBox(
                                    height: 87.h,
                                  ),
                                  SizedBox(
                                    width: 180.w,
                                    height: 50.h,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        validate = false;
                                        Get.back();
                                        (context as Element).markNeedsBuild();
                                      },
                                      style: ElevatedButton.styleFrom(
                                          foregroundColor:
                                              AppColor.primaryColor,
                                          backgroundColor:
                                              AppColor.borderColor,
                                          elevation: 0,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(50.r),
                                          )),
                                      child: Text(
                                        'cancel'.tr,
                                        style: TextStyle(
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 30.w,
                            ),
                            Expanded(
                              flex: 1,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  FormTitle(title: 'last_name'.tr),
                                  CustomFormField(
                                    readOnly: false,
                                    controller:
                                        checkInController.lastNameController,
                                    validatorTxt: 'enter_last_name'.tr,
                                  ),
                                  FormNoteTitle(title: 'phone'.tr),
                                  // CustomFormFieldNum(
                                  //   readOnly: false,
                                  //   controller:
                                  //       checkInController.phoneController,
                                  //   validatorTxt: 'enter_phone_no'.tr,
                                  // ),
                                  IntlPhoneField(
                                    controller:
                                        checkInController.phoneController,
                                    keyboardType: TextInputType.number,
                                    showDropdownIcon: false,
                                    disableLengthCheck: true,
                                    decoration: InputDecoration(
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              vertical: 10.0,
                                              horizontal: 10.0),
                                      errorBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                        borderSide: const BorderSide(
                                          width: 1,
                                          color: AppColor.redColor,
                                        ),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(5.0),
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
                                            width: 1,
                                            color: AppColor.primaryColor),
                                      ),
                                      enabledBorder: const OutlineInputBorder(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(5),
                                          bottomLeft: Radius.circular(5),
                                          topRight: Radius.circular(5),
                                          bottomRight: Radius.circular(5),
                                        ),
                                        borderSide: BorderSide(
                                            width: 1,
                                            color: AppColor.borderColor),
                                      ),
                                    ),
                                    initialCountryCode:
                                        countryCodeName.toUpperCase(),
                                    onChanged: (phone) {
                                      setState(() {
                                        countryCodeName = phone.countryISOCode
                                            .toLowerCase();
                                        countryCode = phone.countryCode
                                            .replaceAll('+', '');
                                      });
                                    },
                                    onCountryChanged: (value) {
                                      countryCode = value.dialCode;
                                      countryCodeName =
                                          value.code.toLowerCase();
                                    },
                                  ),
                                  NonRequiredFormTitle(
                                      title: 'your_company'.tr),
                                  NonRequiredCustomFormField(
                                    controller:
                                        checkInController.companyController,
                                    validatorTxt: 'enter_company_name'.tr,
                                  ),
                                  NonRequiredFormTitle(title: 'address'.tr),
                                  CustomFormNoValidatorField(
                                    controller:
                                        checkInController.addressController,
                                    validatorTxt: 'enter_address'.tr,
                                  ),
                                  // FormTitle(title: 'purpose'.tr),
                                  // CustomLargeForm(
                                  //   controller:
                                  //       checkInController.purposeController,
                                  //   validatorTxt: 'purpose'.tr,
                                  // ),
                                  SizedBox(
                                    height: 55.h,
                                  ),
                                  SizedBox(
                                    width: 180.w,
                                    height: 50.h,
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
                                                BorderRadius.circular(50),
                                          )),
                                      child: Text(
                                        'continue'.tr,
                                        style: TextStyle(
                                          fontSize: 16.sp,
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
                  checkInController.loader
                      ? Container(
                          height: MediaQuery.of(context).size.height,
                          width: MediaQuery.of(context).size.width,
                          color: Colors.white60,
                          child: const Center(
                            child: Loader(),
                          ),
                        )
                      : const SizedBox.shrink()
                ],
              ),
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
