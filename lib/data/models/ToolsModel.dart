class ToolsModel {
  ToolsModel({
      this.id,
      this.name,
    this.quantity=0,
      this.description, 
      this.imageUrl,});

  ToolsModel.fromJson(dynamic json) {
    id = json['toolId']??'';
    name = json['name']??'';
    description = json['description']??'';
    imageUrl = json['imageUrl']??'';
    quantity=0;

  }
  String? id;
  String? name;
  String? description;
  String? imageUrl;
  int? quantity;

  Map<String, dynamic> toJson() {
    quantity=0;

    final map = <String, dynamic>{};
    map['toolId'] = id;
    map['name'] = name;
    map['description'] = description;
    map['imageUrl'] = imageUrl;
    return map;
  }

}