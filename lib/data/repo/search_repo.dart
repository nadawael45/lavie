//class SearchRepo{
//
//  static Future< List <Plant>>  getBlogs(token)async{
//    var response= await Api().getHttp(url: '/api/v1/products/blogs',authToken: token);
//
//
//
//    List<BlogsModel>blogsList=[];
//    for(int i =0;i<response['data']['plants'].length;i++){
//      BlogsModel blogModel=BlogsModel.fromJson(response['data']['plants'][i]);
//      blogsList.add(blogModel);
//
//    }
//    print(response.length);
//    print(blogsList.length);
//
//    return blogsList;
//
//
//  }
//
//}
//}