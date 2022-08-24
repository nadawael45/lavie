//import 'Data.dart';
//
//class BlogResponse {
//  BlogResponse({
//      this.type,
//      this.message,
//      required this.data,});
//
//  BlogResponse.fromJson(dynamic json) {
//    type = json['type'];
//    message = json['message'];
//    data = json['data'] != null ? DataModel.fromJson(json['data']) : null;
//  }
//  String? type;
//  String? message;
//  DataModel? data;
//
//  Map<String, dynamic> toJson() {
//    final map = <String, dynamic>{};
//    map['type'] = type;
//    map['message'] = message;
//    if (data != null) {
//      map['data'] = data!.toJson();
//    }
//    return map;
//  }
//
//}