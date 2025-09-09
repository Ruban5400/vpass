import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:visitor_pass/model/settings_model.dart';
import 'package:visitor_pass/services/api_list.dart';

class SettingsServices {
  static var client = http.Client();
  static Future<SettingsModel?> settings() async {
    try{
      // var response = await client.get(Uri.parse('https://visitor.kauverykonnect.com/api/v1/settings'));
      var response = await client.get(Uri.parse(APIList.settings!));

      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body);
        var settings = SettingsModel.fromJson(jsonResponse);
        return settings;
      } else {
        return null;
      }
    }
    catch(e){
      print('Catch error =-=> $e');
    }

  }
}
