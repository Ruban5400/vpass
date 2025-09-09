class CheckInModel {
  CheckInModel({
    this.status,
    this.message,
  });

  CheckInModel.fromJson(dynamic json) {
    status = json['status'];
    message =
        json['message'] != null ? Message.fromJson(json['message']) : null;
  }
  int? status;
  Message? message;
  CheckInModel copyWith({
    int? status,
    Message? message,
  }) =>
      CheckInModel(
        status: status ?? this.status,
        message: message ?? this.message,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    if (message != null) {
      map['message'] = message?.toJson();
    }
    return map;
  }
}

class Message {
  Message({
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
    this.countryCode,
    this.countryCodeName,
    this.employeeId,
    this.gender,
    this.purpose,
  });

  Message.fromJson(dynamic json) {
    firstName =
        json['first_name'] != null ? json['first_name'].cast<String>() : [];
    lastName =
        json['last_name'] != null ? json['last_name'].cast<String>() : [];
    email = json['email'] != null ? json['email'].cast<String>() : [];
    phone = json['phone'] != null ? json['phone'].cast<String>() : [];
    employeeId =
        json['employee_id'] != null ? json['employee_id'].cast<String>() : [];
    gender = json['gender'] != null ? json['gender'].cast<String>() : [];
    purpose = json['purpose'] != null ? json['purpose'].cast<String>() : [];
  }
  List<String>? firstName;
  List<String>? lastName;
  List<String>? email;
  List<String>? phone;
  List<String>? countryCode;
  List<String>? countryCodeName;
  List<String>? employeeId;
  List<String>? gender;
  List<String>? purpose;

  Message copyWith({
    List<String>? firstName,
    List<String>? lastName,
    List<String>? email,
    List<String>? phone,
    List<String>? countryCode,
    List<String>? countryCodeName,
    List<String>? employeeId,
    List<String>? gender,
    List<String>? purpose,
  }) =>
      Message(
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        email: email ?? this.email,
        phone: phone ?? this.phone,
        countryCode: countryCode ?? this.countryCode,
        countryCodeName: countryCodeName ?? this.countryCodeName,
        employeeId: employeeId ?? this.employeeId,
        gender: gender ?? this.gender,
        purpose: purpose ?? this.purpose,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['first_name'] = firstName;
    map['last_name'] = lastName;
    map['email'] = email;
    map['phone'] = phone;
    map['country_code'] = countryCode;
    map['country_code_name'] = countryCodeName;
    map['employee_id'] = employeeId;
    map['gender'] = gender;
    map['purpose'] = purpose;
    return map;
  }
}
