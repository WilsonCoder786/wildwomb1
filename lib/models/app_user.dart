class AppUser {
  late String id;
  late String name;
  late String email;
  late String phone;
  late String photoUrl;
  late String signInMethod;
  late String password;
  late String confirmPassword;

  AppUser() {
    id = "";
    name = "";
    email = "";
    phone = "";
    photoUrl = "";
    signInMethod = "";
    password = "";
    confirmPassword = "";
  }

  AppUser.fromJson(Map<String, dynamic> json) {
    id = json["id"] ?? "";
    name = json["name"] ?? "";
    email = json["email"] ?? "";
    phone = json["phone"] ?? "";
    photoUrl = json["photoUrl"] ?? "";
    signInMethod = json["sign_in_method"] ?? "";
    password = json["password"] ?? "";
    confirmPassword = json["confirmPassword"] ?? "";
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map["id"] = id;
    map["name"] = name;
    map["email"] = email;
    map["phone"] = phone;
    map["photoUrl"] = photoUrl;
    map["sign_in_method"] = signInMethod;

    return map;
  }
}
