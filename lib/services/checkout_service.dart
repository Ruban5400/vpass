import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:visitor_pass/services/api_list.dart';

class CeckOutService {
  static var client = http.Client();
  static checkOutService(String visitorId) async {
    var response =
        await client.get(Uri.parse(APIList.checkOut! + visitorId));
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      return jsonResponse;
    } else if (response.statusCode == 404) {
      var jsonResponse = jsonDecode(response.body);
      return jsonResponse;
    } else {
      return null;
    }
  }
}
