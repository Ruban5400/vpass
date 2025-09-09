import 'package:get/get.dart';
import 'package:visitor_pass/model/employee_model.dart';
import 'package:visitor_pass/services/employee_services.dart';

class EmployeeController extends GetxController {
  var isLoading = false.obs;
  List<EmployeeData> employeeList = <EmployeeData>[];
  var employeeIndex = 0;
  @override
  void onInit() {
    getEmployeeList();
    super.onInit();
  }

  getEmployeeList() async {
    try {
      var employees = await EmployeeServices.employeeList();
      if (employees != null) {
        employeeList = <EmployeeData>[];
        employeeList.addAll(employees.data!);
        isLoading.value = true;
        employeeIndex = 0;

        update();
      }
      update();
    } finally {
      isLoading(false);
      update();
    }
  }
}
