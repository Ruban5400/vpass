import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:visitor_pass/model/employee_model.dart';
import 'package:visitor_pass/services/api_list.dart';

class EmployeeServices {
  static var client = http.Client();
  static Future<EmployeeModel?> employeeList() async {
    var response = await client.get(Uri.parse(APIList.employee!));
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      var employeeList = EmployeeModel.fromJson(jsonResponse['data']);
      return employeeList;
    } else {
      return null;
    }
  }
}
