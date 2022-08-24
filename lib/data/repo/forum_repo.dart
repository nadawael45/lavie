import 'package:lavie/data/models/BlogResponse.dart';
import 'package:lavie/data/models/BlogsModel.dart';
import 'package:lavie/data/models/ForumModel.dart';
import 'package:lavie/data/models/MyForumModel.dart';

import '../api/api.dart';

class ForumRepo{
  static Future< List <MyForumModel>>  getBlogs(token)async{
    var response= await Api().getHttp(url: 'api/v1/forums/me',authToken: token);


  print(response);
  print(response['data']);
    print(response['data'][0]);

    List<MyForumModel>blogsList=[];
//    for(int i =0;i<response['data'].length;i++){
//      MyForumModel blogModel=MyForumModel.fromJson(response['data'][i]);
//      blogsList.add(blogModel);
//
//    }
    print(response.length);
    print(blogsList.length);

    return blogsList;


  }

}