class EmployeeModel {
  EmployeeModel({
    int? status,
    List<EmployeeData>? data,
  }) {
    _status = status;
    _data = data;
  }

  EmployeeModel.fromJson(dynamic json) {
    _status = json['status'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(EmployeeData.fromJson(v));
      });
    }
  }
  int? _status;
  List<EmployeeData>? _data;

  int? get status => _status;
  List<EmployeeData>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class EmployeeData {
  EmployeeData({
    int? id,
    String? name,
    String? deptName,
    String? phone,
    String? countryCode,
    String? countryCodeName,
    String? gender,
    dynamic officialIdentificationNumber,
    String? dateOfJoining,
    String? status,
    int? userId,
    String? about,
    String? image,
  }) {
    _id = id;
    _name = name;
    _deptName = deptName;
    _phone = phone;
    _countryCode = countryCode;
    _countryCodeName = countryCodeName;
    _gender = gender;
    _officialIdentificationNumber = officialIdentificationNumber;
    _dateOfJoining = dateOfJoining;
    _status = status;
    _userId = userId;
    _about = about;
    _image = image;
  }

  EmployeeData.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _deptName = json['department']['name'];
    _phone = json['phone'];
    _countryCode = json['country_code'];
    _countryCodeName = json['country_code_name'];
    _gender = json['gender'];
    _officialIdentificationNumber = json['official_identification_number'];
    _dateOfJoining = json['date_of_joining'];
    _status = json['status'];
    _userId = json['user_id'];
    _about = json['about'];
    _image = json['image'];
  }
  int? _id;
  String? _name;
  String? _deptName;
  String? _phone;
  String? _countryCode;
  String? _countryCodeName;
  String? _gender;
  dynamic _officialIdentificationNumber;
  String? _dateOfJoining;
  String? _status;
  int? _userId;
  String? _about;
  String? _image;

  int? get id => _id;
  String? get name => _name;
  String? get deptName => _deptName;
  String? get phone => _phone;
  String? get countryCode => _countryCode;
  String? get countryCodeName => _countryCodeName;
  String? get gender => _gender;
  dynamic get officialIdentificationNumber => _officialIdentificationNumber;
  String? get dateOfJoining => _dateOfJoining;
  String? get status => _status;
  int? get userId => _userId;
  String? get about => _about;
  String? get image => _image;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['deptName'] = _deptName;
    map['phone'] = _phone;
    map['country_code'] = _countryCode;
    map['country_code_name'] = _countryCodeName;
    map['gender'] = _gender;
    map['official_identification_number'] = _officialIdentificationNumber;
    map['date_of_joining'] = _dateOfJoining;
    map['status'] = _status;
    map['user_id'] = _userId;
    map['about'] = _about;
    map['image'] = _image;
    return map;
  }
}
