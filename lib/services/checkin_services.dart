import 'package:http/http.dart' as http;
import 'package:visitor_pass/services/api_list.dart';

import '../constants/constants.dart';

class CheckInServices {
  static var client = http.Client();

  visitorCheckInPost(body, filepath) async {
    Map<String, String> headers = {
      'Content-Type': 'multipart/form-data',
    };
    http.MultipartRequest response;

    if (box.read('photoCaptureEnable') == "1") {
      response = http.MultipartRequest('POST', Uri.parse(APIList.checkIn!))
        ..fields.addAll(body)
        ..headers.addAll(headers)
        ..files.add(await http.MultipartFile.fromPath('image', filepath));
    } else {
      response = http.MultipartRequest('POST', Uri.parse(APIList.checkIn!))
        ..fields.addAll(body)
        ..headers.addAll(headers);
    }

    return await response.send();
  }

  visitorValidateCheckInPost(body) async {
    Map<String, String> headers = {
      'Content-Type': 'multipart/form-data',
    };
    http.MultipartRequest response;

    response =
        http.MultipartRequest('POST', Uri.parse(APIList.checkInValidate!))
          ..fields.addAll(body)
          ..headers.addAll(headers);

    return await response.send();
  }
}
