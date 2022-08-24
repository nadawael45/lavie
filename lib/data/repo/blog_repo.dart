import 'package:lavie/data/models/BlogResponse.dart';
import 'package:lavie/data/models/BlogsModel.dart';

import '../api/api.dart';

class BlogRepo{
  static Future< List <BlogsModel>>  getBlogs(token)async{
    var response= await Api().getHttp(url: '/api/v1/products/blogs',authToken: token);
//    print(response);
//
//    BlogResponse blogResponse = BlogResponse.fromJson(response);
//     var tt= blogResponse.data!.plants;
//
//    print(tt!.length);
//    return tt;


    List<BlogsModel>blogsList=[];
    for(int i =0;i<response['data']['plants'].length;i++){
      BlogsModel blogModel=BlogsModel.fromJson(response['data']['plants'][i]);
      blogsList.add(blogModel);

    }
    print(response.length);
    print(blogsList.length);

    return blogsList;


  }

}