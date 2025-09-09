class SettingsModel {
  SettingsModel({
    num? status,
    SettingsData? data,
  }) {
    _status = status;
    _data = data;
  }

  SettingsModel.fromJson(dynamic json) {
    _status = json['status'];
    _data = json['data'] != null ? SettingsData.fromJson(json['data']) : null;
  }
  num? _status;
  SettingsData? _data;

  num? get status => _status;
  SettingsData? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }
}

class SettingsData {
  SettingsData({
    String? siteEmail,
    String? siteName,
    String? sitePhoneNumber,
    String? siteLogo,
    String? siteFooter,
    String? photoCaptureEnable,
    String? siteAddress,
    String? siteDescription,
    String? welcomeScreen,
    String? termsCondition,
  }) {
    _siteEmail = siteEmail;
    _siteName = siteName;
    _sitePhoneNumber = sitePhoneNumber;
    _siteLogo = siteLogo;
    _siteFooter = siteFooter;
    _photoCaptureEnable = photoCaptureEnable;
    _siteAddress = siteAddress;
    _siteDescription = siteDescription;
    _welcomeScreen = welcomeScreen;
    _termsCondition = termsCondition;
  }

  SettingsData.fromJson(dynamic json) {
    _siteEmail = json['site_email'];
    _siteName = json['site_name'];
    _sitePhoneNumber = json['site_phone_number'];
    _siteLogo = json['site_logo'];
    _siteFooter = json['site_footer'];
    _photoCaptureEnable = json['photo_capture_enable'];
    _siteAddress = json['site_address'];
    _siteDescription = json['site_description'];
    _welcomeScreen = json['welcome_screen'];
    _termsCondition = json['terms_condition'];
  }
  String? _siteEmail;
  String? _siteName;
  String? _sitePhoneNumber;
  String? _siteLogo;
  String? _siteFooter;
  String? _photoCaptureEnable;
  String? _siteAddress;
  String? _siteDescription;
  String? _welcomeScreen;
  String? _termsCondition;

  String? get siteEmail => _siteEmail;
  String? get siteName => _siteName;
  String? get sitePhoneNumber => _sitePhoneNumber;
  String? get siteLogo => _siteLogo;
  String? get siteFooter => _siteFooter;
  String? get photoCaptureEnable => _photoCaptureEnable;
  String? get siteAddress => _siteAddress;
  String? get siteDescription => _siteDescription;
  String? get welcomeScreen => _welcomeScreen;
  String? get termsCondition => _termsCondition;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['site_email'] = _siteEmail;
    map['site_name'] = _siteName;
    map['site_phone_number'] = _sitePhoneNumber;
    map['site_logo'] = _siteLogo;
    map['site_footer'] = _siteFooter;
    map['photo_capture_enable'] = _photoCaptureEnable;
    map['site_address'] = _siteAddress;
    map['site_description'] = _siteDescription;
    map['welcome_screen'] = _welcomeScreen;
    map['terms_condition'] = _termsCondition;
    return map;
  }
}
