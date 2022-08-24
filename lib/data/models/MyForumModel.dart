import 'User.dart';

class MyForumModel {
  MyForumModel({
      this.forumId, 
      this.title, 
      this.description, 
     // this.imageUrl,
      this.userId, 
//      this.forumLikes,
//      this.forumComments,
    //  this.user,
  });

  MyForumModel.fromJson(dynamic json) {
    forumId = json['forumId'];
    title = json['title'];
    description = json['description'];
  //  imageUrl = json['imageUrl'];
  //  userId = json['userId'];
//    if (json['ForumLikes'] != null) {
//      forumLikes = [];
//      json['ForumLikes'].forEach((v) {
//        forumLikes.add(Dynamic.fromJson(v));
//      });
//    }
//    if (json['ForumComments'] != null) {
//      forumComments = [];
//      json['ForumComments'].forEach((v) {
//        forumComments.add(Dynamic.fromJson(v));
//      });
//    }
   // user = json['user'] != null ? User.fromJson(json['user']) : null;
  }
  String? forumId;
  String? title;
  String? description;
  String? imageUrl;
  String? userId;
//  List<dynamic> forumLikes;
//  List<dynamic> forumComments;
 // User? user;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['forumId'] = forumId;
    map['title'] = title;
    map['description'] = description;
    map['imageUrl'] = imageUrl;
    map['userId'] = userId;
//    if (forumLikes != null) {
//      map['ForumLikes'] = forumLikes.map((v) => v.toJson()).toList();
//    }
//    if (forumComments != null) {
//      map['ForumComments'] = forumComments.map((v) => v.toJson()).toList();
//    }
//    if (user != null) {
//      map['user'] = user.toJson();
//    }
    return map;
  }

}