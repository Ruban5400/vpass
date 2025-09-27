// ignore_for_file: must_be_immutable
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:visitor_pass/controller/checkin_controller.dart';
import 'package:visitor_pass/controller/employee_controller.dart';
import 'package:visitor_pass/model/employee_model.dart';
import 'package:visitor_pass/views/pages/checkin/mobile/visitor_checkin_page.dart';

import '../../../../constants/constants.dart';
import '../../../widget/custom_large_field.dart';
import '../../../widget/form_title.dart';
import '../../../widget/loader.dart';
import '../tablet/visitor_checkin_page_tablet.dart';

class VisitorCheckInFirstPage extends StatelessWidget {
  VisitorCheckInFirstPage({Key? key}) : super(key: key);
  final EmployeeController employeeController = Get.put(EmployeeController());
  final CheckInController checkInController = Get.put(CheckInController());

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool validate = false;

  int? selectedEmployee = 0;
  int? selectedEmployeeID;
  double heightEmployee = 60;

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
                            FormTitle(title: 'select_employee'.tr),
                            GetBuilder<EmployeeController>(
                                init: EmployeeController(),
                                builder: (controller) {
                                  return Container(
                                    child: controller.employeeList.isEmpty
                                        ? Container(
                                            height: 50,
                                            color: Colors.white,
                                            child: Center(
                                                child: Text(
                                              'no_data_found'.tr,
                                              style: const TextStyle(
                                                  color: Colors.red),
                                            )),
                                          )
                                        : Padding(
                                            padding:
                                                const EdgeInsets.only(top: 10),
                                            child: SizedBox(
                                              height: heightEmployee,
                                              width: double.infinity,
                                              child: DropdownSearch(
                                                //mode of dropdown
                                                popupProps: PopupProps.menu(
                                                  showSearchBox: true,
                                                  showSelectedItems: true,
                                                  disabledItemFn: (String s) =>
                                                      false,
                                                ),
                                                decoratorProps:
                                                    DropDownDecoratorProps(
                                                  decoration:
                                                      // ignore: prefer_const_constructors
                                                      InputDecoration(
                                                    contentPadding:
                                                        const EdgeInsets
                                                            .symmetric(
                                                            vertical: 10.0,
                                                            horizontal: 10.0),
                                                    errorBorder:
                                                        OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.0),
                                                      borderSide:
                                                          const BorderSide(
                                                        width: 1,
                                                        color:
                                                            AppColor.redColor,
                                                      ),
                                                    ),
                                                    focusedErrorBorder:
                                                        OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.0),
                                                      borderSide:
                                                          const BorderSide(
                                                        width: 1,
                                                        color:
                                                            AppColor.redColor,
                                                      ),
                                                    ),
                                                    fillColor: Colors.red,
                                                    focusedBorder:
                                                        const OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  10)),
                                                      borderSide: BorderSide(
                                                          width: 1,
                                                          color: AppColor
                                                              .primaryColor),
                                                    ),
                                                    enabledBorder:
                                                        const OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  10)),
                                                      borderSide: BorderSide(
                                                          width: 1,
                                                          color: AppColor
                                                              .borderColor),
                                                    ),
                                                  ),
                                                ),
                                                // mode: Mode.MENU,
                                                // showSearchBox: true,
                                                items: (filter, loadProps) =>
                                                    controller.employeeList.map(
                                                        (EmployeeData value) {
                                                  return "${value.name.toString()} - ${value.deptName.toString()}";
                                                }).toList(),
                                                onChanged: (employeeName) {
                                                  EmployeeData employee =
                                                      controller
                                                          .employeeList
                                                          .where((data) =>
                                                              data.name ==
                                                              employeeName)
                                                          .toList()
                                                          .first;
                                                  selectedEmployeeID =
                                                      employee.id;
                                                  checkInController.employeeID =
                                                      employee.id!.toString();
                                                  (context as Element)
                                                      .markNeedsBuild();
                                                },
                                                validator: (String?
                                                    selectedEmployeeID) {
                                                  if (selectedEmployeeID ==
                                                      null) {
                                                    heightEmployee = 83;
                                                    (context as Element)
                                                        .markNeedsBuild();
                                                    return 'choose_employee'.tr;
                                                  } else {
                                                    return null;
                                                  }
                                                },
                                              ),
                                            ),
                                          ),
                                  );
                                }),
                            FormTitle(title: 'purpose'.tr),
                            CustomLargeForm(
                              controller: checkInController.purposeController,
                              validatorTxt: 'purpose'.tr,
                            ),
                            const SizedBox(
                              height: 42,
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
      box.read('isMobile')
          ? Get.to(VisitorCheckInPage())
          : Get.to(VisitorCheckInPageTablet());
    } else {
      validate = false;
    }
  }
}
