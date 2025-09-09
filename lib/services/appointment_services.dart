import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:visitor_pass/model/appoinment_model.dart';
import 'api_list.dart';

class Appointment {
  static var client = http.Client();
  Future<AppoinmentModel?> findAppointment(visitorMail) async {
    Map<String, String> visitorData = {
      'email': visitorMail,
    };
    var response = await client.post(
      Uri.parse(APIList.appointment!),
      body: jsonEncode(visitorData),
      headers: _setHeaders(),
    );
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      var appoinmentData = AppoinmentModel.fromJson(jsonResponse['data']);

      return appoinmentData;
    } else if (response.statusCode == 404) {
      var jsonResponse = jsonDecode(response.body);
      var appoinmentData = AppoinmentModel.fromJson(jsonResponse['data']);
      return appoinmentData;
    } else {
      return null;
    }
  }
  
  Future<AppoinmentModel?> findAppointmentForPreRegister(visitorMail) async {
    Map<String, String> visitorData = {
      'email': visitorMail,
    };
    var response = await client.post(
      Uri.parse(APIList.appointment!),
      body: jsonEncode(visitorData),
      headers: _setHeaders(),
    );
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      var appoinmentData = AppoinmentModel.fromJson(jsonResponse['data']);

      return appoinmentData;
    } else if (response.statusCode == 404) {
      var jsonResponse = jsonDecode(response.body);
      var appoinmentData = AppoinmentModel.fromJson(jsonResponse['data']);
      return appoinmentData;
    } else {
      return null;
    }
  }
  Future<AppoinmentModel?> findAppointmentForVisitor(visitorMail) async {
    Map<String, String> visitorData = {
      'email': visitorMail,
    };
    var response = await client.post(
      Uri.parse(APIList.findVisitor!),
      body: jsonEncode(visitorData),
      headers: _setHeaders(),
    );
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      var appoinmentData = AppoinmentModel.fromJson(jsonResponse['data']);

      return appoinmentData;
    } else if (response.statusCode == 404) {
      var jsonResponse = jsonDecode(response.body);
      var appoinmentData = AppoinmentModel.fromJson(jsonResponse['data']);
      return appoinmentData;
    } else {
      return null;
    }
  }

  _setHeaders() => {
        'Content-type': 'application/json',
        'Accept': 'application/json',
      };
}
