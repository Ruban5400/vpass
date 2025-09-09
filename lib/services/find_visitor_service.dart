import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:visitor_pass/model/Find_visitor_model.dart';
import 'api_list.dart';

class FindVisitor {
  static var client = http.Client();
  Future<FindVisitorModel?> findVisitor(visitorMail) async {
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
      var findVisitroData = FindVisitorModel.fromJson(jsonResponse['data']);
      return findVisitroData;
    } else if (response.statusCode == 404) {
      var jsonResponse = jsonDecode(response.body);
      var findVisitroData = FindVisitorModel.fromJson(jsonResponse['data']);
      return findVisitroData;
    } else {
      return null;
    }
  }

  _setHeaders() => {
        'Content-type': 'application/json',
        'Accept': 'application/json',
      };
}
