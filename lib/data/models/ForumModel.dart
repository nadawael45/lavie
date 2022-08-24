class ForumModel {

  ForumModel({
      this.title, 
      this.description, 
      this.imageBase64,});

  ForumModel.fromJson(dynamic json) {
    title = json['title'];
    description = json['description'];
    imageBase64 = json['imageBase64'];
  }
  String? title;
  String? description;
  String? imageBase64;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['title'] = title;
    map['description'] = description;
    map['imageBase64'] = imageBase64;
    return map;
  }

}