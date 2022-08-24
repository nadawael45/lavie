import 'package:lavie/data/models/BlogResponse.dart';
import 'package:lavie/data/models/BlogsModel.dart';
import 'package:lavie/data/models/MyForumModel.dart';

import '../../../data/models/ForumModel.dart';

abstract class ForumState{}

class ForumLoading extends ForumState{}

class AddSuccess extends ForumState{
}
class AddFailed extends ForumState{
}
class GetFailed extends ForumState{
}
class GetSuccess extends ForumState{

  final List<MyForumModel>blogList;
  GetSuccess(this.blogList);
}

class ImageGallery extends ForumState{}
class ImageCamera extends ForumState{}
