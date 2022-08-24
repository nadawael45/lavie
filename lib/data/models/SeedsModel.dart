class SeedsModel {
  SeedsModel({
      this.id,
      this.name,
    this.quantity,
      this.description, 
      this.imageUrl,});

  SeedsModel.fromJson(dynamic json) {
    id = json['seedId']??'';
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
    map['seedId'] = id;
    map['name'] = name;
    map['description'] = description;
    map['imageUrl'] = imageUrl;
    return map;
  }

}