class FindVisitorModel {
  FindVisitorModel({
    int? status,
    String? message,
    Visitor? visitor,
    String? visitedBefore,
  }) {
    _status = status;
    _message = message;
    _visitor = visitor;
    _visitedBefore = visitedBefore;
  }

  FindVisitorModel.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    _visitor =
        json['visitor'] != null ? Visitor.fromJson(json['visitor']) : null;
    _visitedBefore = json['visited_before'];
  }
  int? _status;
  Visitor? _visitor;
  String? _message;
  String? _visitedBefore;

  int? get status => _status;
  String? get message => _message;
  Visitor? get visitor => _visitor;
  String? get visitedBefore => _visitedBefore;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['message'] = _message;
    if (_visitor != null) {
      map['visitor'] = _visitor?.toJson();
    }
    map['visited_before'] = _visitedBefore;
    return map;
  }
}

class Visitor {
  Visitor({
    int? id,
    String? firstName,
    String? lastName,
    String? name,
    String? email,
    String? phone,
    String? countryCode,
    String? countryCodeName,
    String? nationalIdentificationNo,
    String? gender,
    String? address,
    String? image,
    String? status,
  }) {
    _id = id;
    _firstName = firstName;
    _lastName = lastName;
    _name = name;
    _email = email;
    _phone = phone;
    _countryCode = countryCode;
    _countryCodeName = countryCodeName;
    _nationalIdentificationNo = nationalIdentificationNo;
    _gender = gender;
    _address = address;
    _image = image;
    _status = status;
  }

  Visitor.fromJson(dynamic json) {
    _id = json['id'];
    _firstName = json['first_name'];
    _lastName = json['last_name'];
    _name = json['name'];
    _email = json['email'];
    _phone = json['phone'];
    _countryCode = json['country_code'];
    _countryCodeName = json['country_code_name'];
    _nationalIdentificationNo = json['national_identification_no'];
    _gender = json['gender'];
    _address = json['address'];
    _image = json['image'];
    _status = json['status'];
  }
  int? _id;
  String? _firstName;
  String? _lastName;
  String? _name;
  String? _email;
  String? _phone;
  String? _countryCode;
  String? _countryCodeName;
  String? _nationalIdentificationNo;
  String? _gender;
  String? _address;
  String? _image;
  String? _status;

  int? get id => _id;
  String? get firstName => _firstName;
  String? get lastName => _lastName;
  String? get name => _name;
  String? get email => _email;
  String? get phone => _phone;
  String? get countryCode => _countryCode;
  String? get countryCodeName => _countryCodeName;
  String? get nationalIdentificationNo => _nationalIdentificationNo;
  String? get gender => _gender;
  String? get address => _address;
  String? get image => _image;
  String? get status => _status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['first_name'] = _firstName;
    map['last_name'] = _lastName;
    map['name'] = _name;
    map['email'] = _email;
    map['phone'] = _phone;
    map['country_code'] = _countryCode;
    map['country_code_name'] = _countryCodeName;
    map['national_identification_no'] = _nationalIdentificationNo;
    map['gender'] = _gender;
    map['address'] = _address;
    map['image'] = _image;
    map['status'] = _status;
    return map;
  }
}
