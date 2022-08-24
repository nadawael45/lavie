class UserModel {
  String? firstName;
  String? lastName;
  String? email;
  String? password;
  String? photo;
  String? id;
  UserModel({
      this.firstName, 
      this.lastName, 
      this.email,
    this.id,
    this.photo,
      this.password,});

  UserModel.fromJson(dynamic json) {
    firstName = json['firstName']??'';
    lastName = json['lastName']??'';
    email = json['email']??'';
    password = json['password']??'';
  }


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['firstName'] = firstName;
    map['lastName'] = lastName;
    map['email'] = email;
    map['password'] = password;
    return map;
  }

}