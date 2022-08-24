class PlantModel {
  PlantModel({
      this.id,
      this.name, 
      this.description, 
      this.imageUrl, 
      this.waterCapacity, 
      this.sunLight,
    this.quantity=0,
      this.temperature,});

  PlantModel.fromJson(dynamic json) {
    id = json['plantId'];
    name = json['name'];
    description = json['description']??'';
    imageUrl = json['imageUrl']??'';
    waterCapacity = json['waterCapacity']??'';
    sunLight = json['sunLight']??'';
    temperature = json['temperature']??'';
    quantity=0;
  }
  String? id;
  String? name;
  String? description;
  String? imageUrl;
  int? waterCapacity;
  int? sunLight;
  int? temperature;
  int? quantity;

  Map<String, dynamic> toJson() {

    final map = <String, dynamic>{};
    map['plantId'] = id;
    map['name'] = name;
    map['description'] = description;
    map['imageUrl'] = imageUrl;
    map['waterCapacity'] = waterCapacity;
    map['sunLight'] = sunLight;
    map['temperature'] = temperature;
    return map;
  }

}