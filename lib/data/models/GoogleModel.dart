class GoogleModel {
  GoogleModel({
      this.id, 
      this.email, 
      this.firstName, 
      this.lastName, 
      this.picture,});

  GoogleModel.fromJson(dynamic json) {
    id = json['id'];
    email = json['email'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    picture = json['picture'];
  }
  String? id;
  String? email;
  String? firstName;
  String? lastName;
  String? picture;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['email'] = email;
    map['firstName'] = firstName;
    map['lastName'] = lastName;
    map['picture'] = picture;
    return map;
  }

}