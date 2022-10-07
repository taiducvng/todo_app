class RegisterRequestModel {
  String? name;
  String? email;
  String? password;
  int? age;

  RegisterRequestModel({this.name, this.email, this.password, this.age});

  RegisterRequestModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    password = json['password'];
    age = json['age'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['email'] = email;
    data['password'] = password;
    data['age'] = age;
    return data;
  }
}

class RegisterResponseModel {
  final String token;
  final String error;

  RegisterResponseModel({required this.token, required this.error});

  factory RegisterResponseModel.fromJson(Map<String, dynamic> json) {
    return RegisterResponseModel(
      token: json["token"] ?? "",
      error: json["error"] ?? "",
    );
  }
}
