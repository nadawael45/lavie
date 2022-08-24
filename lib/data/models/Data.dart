

import 'dart:convert';

AllModel allModelFromJson(String str) => AllModel.fromJson(json.decode(str));

String allModelToJson(AllModel data) => json.encode(data.toJson());

class AllModel {
  AllModel({
    required this.type,
    required this.message,
    required this.data,
  });

  String type;
  String message;
  List<Datum> data;

  factory AllModel.fromJson(Map<String, dynamic> json) => AllModel(
    type: json["type"],
    message: json["message"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "type": type,
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
     this.productId,
    required this.name,
     this.description,
    required this.imageUrl,
     this.type,
    required this.price,
     this.available,
     this.seed,
     this.plant,
     this.tool,
    this.quantity=0
  });

  String? productId;
  String name;
  Description? description;
  String imageUrl;
  Type? type;
  int price;
  bool? available;
  Seeds ?seed;
  Plants? plant;
  Seeds ?tool;
  int quantity;

//  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
//    productId: json["productId"]??'',
//    name: json["name"]??'',
//    description: descriptionValues.map[json["description"]],
//    imageUrl: json["imageUrl"]??'',
//    type: typeValues.map[json["type"]],
//    price: json["price"]??'',
//    available: json["available"]??'',
//    seed: json["seed"] == null ? null : Seeds.fromJson(json["seed"]),
//    plant: json["plant"] == null ? null : Plants.fromJson(json["plant"]),
//    tool: json["tool"] == null ? null : Seeds.fromJson(json["tool"]),
//  );
  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    productId: '',
    name: json["name"]??'',
   // description: descriptionValues.map[json["description"]],
    imageUrl: json["imageUrl"]??'',
   // type: typeValues.map[json["type"]],
    price: json["price"]??'',
//    available: json["available"]??'',
//    seed: json["seed"] == null ? null : Seeds.fromJson(json["seed"]),
//    plant: json["plant"] == null ? null : Plants.fromJson(json["plant"]),
  //  tool: json["tool"] == null ? null : Seeds.fromJson(json["tool"]),
  );
  Map<String, dynamic> toJson() => {
    "productId": productId,
    "name": name,
    "description": descriptionValues.reverse[description],
    "imageUrl": imageUrl,
    "type": typeValues.reverse[type],
    "price": price,
    "available": available,
    "seed": seed == null ? null : seed!.toJson(),
    "plant": plant == null ? null : plant!.toJson(),
    "tool": tool == null ? null : tool!.toJson(),
  };
}

enum Description { ARIZONA_ACHIEVED_STATEHOOD, THIS_SPRING_BLOOMER, WIL_FIKS_CHOPPING_AXE }

final descriptionValues = EnumValues({
  "Arizona achieved statehood": Description.ARIZONA_ACHIEVED_STATEHOOD,
  "This spring bloomer": Description.THIS_SPRING_BLOOMER,
  "WilFiks Chopping Axe": Description.WIL_FIKS_CHOPPING_AXE
});

class Plants {
  Plants({
    required this.plantId,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.waterCapacity,
    required this.sunLight,
    required this.temperature,
  });

  String plantId;
  String name;
  String description;
  String imageUrl;
  int waterCapacity;
  int sunLight;
  int temperature;

  factory Plants.fromJson(Map<String, dynamic> json) => Plants(
    plantId: json["plantId"],
    name: json["name"],
    description: json["description"],
    imageUrl: json["imageUrl"],
    waterCapacity: json["waterCapacity"],
    sunLight: json["sunLight"],
    temperature: json["temperature"],
  );

  Map<String, dynamic> toJson() => {
    "plantId": plantId,
    "name": name,
    "description": description,
    "imageUrl": imageUrl,
    "waterCapacity": waterCapacity,
    "sunLight": sunLight,
    "temperature": temperature,
  };
}

class Seeds {
  Seeds({
    required this.seedId,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.toolId,
  });

  String seedId;
  String name;
  String description;
  String imageUrl;
  String toolId;

  factory Seeds.fromJson(Map<String, dynamic> json) => Seeds(
    seedId: json["seedId"] == null ? null : json["seedId"],
    name: json["name"],
    description: json["description"],
    imageUrl: json["imageUrl"],
    toolId: json["toolId"] == null ? null : json["toolId"],
  );

  Map<String, dynamic> toJson() => {
    "seedId": seedId == null ? null : seedId,
    "name": name,
    "description": description,
    "imageUrl": imageUrl,
    "toolId": toolId == null ? null : toolId,
  };
}

enum Type { PLANT, SEED, TOOL }

final typeValues = EnumValues({
  "PLANT": Type.PLANT,
  "SEED": Type.SEED,
  "TOOL": Type.TOOL
});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> ?reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap!;
  }
}
