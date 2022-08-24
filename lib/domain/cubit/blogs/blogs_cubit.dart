import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lavie/data/repo/blog_repo.dart';
import 'package:lavie/domain/cubit/blogs/blogs_state.dart';

class BlogsCubit  extends Cubit<BlogsState> {
  BlogsCubit() : super(BlogLoading());

  static BlogsCubit get(context) => BlocProvider.of(context);
  Connectivity connectivity =  Connectivity();

  getBlogsCubit(token){
    print(token);
    connectivity.checkConnectivity().then((value)async{
      if(ConnectivityResult.none == value){
        emit(GetBlogFailed("Check your internet connection and try again"));
      }else{
        BlogRepo.getBlogs(token).then((value) => {
          print('..................................'),
          print(value),
          emit(GetBlogSuccess(value))
        }).onError((error, stackTrace) => {
          emit(GetBlogFailed(error.toString())),
          print(error)

        });
      }

    });
  }

}