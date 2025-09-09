import 'package:get/get.dart';
import 'package:visitor_pass/model/settings_model.dart';
import 'package:visitor_pass/services/settings_service.dart';

import '../constants/constants.dart';

class HomeController extends GetxController {
  var isLoading = false.obs;
  SettingsData settingsData = SettingsData();
  bool lodear = true;
  @override
  void onInit() {
    getSettings();
    super.onInit();
  }

  getSettings() async {
    try {
      var setting = await SettingsServices.settings();
      if (setting != null) {
        lodear = false;
        settingsData = setting.data!;
        box.write('photoCaptureEnable', settingsData.photoCaptureEnable);
        update();
      }
      update();
    } finally {
      lodear = false;
      update();
    }
  }
}
