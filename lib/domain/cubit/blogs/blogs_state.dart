import 'package:lavie/data/models/BlogResponse.dart';
import 'package:lavie/data/models/BlogsModel.dart';

abstract class BlogsState{}

class BlogLoading extends BlogsState{}

class GetBlogSuccess extends BlogsState{

  final List<BlogsModel>blogList;
  GetBlogSuccess(this.blogList);
}

class GetBlogFailed extends BlogsState{

  final String msg;
  GetBlogFailed(this.msg);
}