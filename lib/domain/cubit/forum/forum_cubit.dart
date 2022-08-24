import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lavie/data/api/api.dart';
import 'package:flutter/material.dart';
import 'package:lavie/data/local/cacheHelper.dart';
import 'package:lavie/data/repo/forum_repo.dart';
import 'package:lavie/domain/cubit/forum/forum_state.dart';
import 'package:lavie/shared/constants/keys/keys.dart';

class ForumCubit  extends Cubit<ForumState> {
  ForumCubit() : super(ForumLoading());
var image;
  static ForumCubit get(context) => BlocProvider.of(context);
  Connectivity connectivity =  Connectivity();

  addForum(forummodel) {
    String token=CacheHelper.getString(SharedKeys.token);
    var response =
    Api().postHttp(url: '/api/v1/forums',data: forummodel.toJson(),authToken: token);

    print(response);
    print('kkkkkkkkkkkkkkkkkkkkkkkk');

    response.then((value) => {
    print(value),

      emit(AddSuccess())

    }).onError((error, stackTrace) => {
      emit(AddFailed()),
      print(error),

    });



  }
  pickFromCamera(BuildContext context) async {
    var img = await ImagePicker().pickImage(source: ImageSource.camera);
    image = File(img!.path);
    Navigator.of(context).pop();
    print(image);
    emit(ImageCamera());

  }
  pickFromGallery(BuildContext context) async {
    var img = await ImagePicker().pickImage(source: ImageSource.gallery);
    image = File(
      img!.path,
    );
    Navigator.of(context).pop();
    print(image);
    emit(ImageGallery());


  }


  getForumCubit(token){
    print(token);
    connectivity.checkConnectivity().then((value)async{
      if(ConnectivityResult.none == value){
        emit(GetFailed());
      }else{
        ForumRepo.getBlogs(token).then((value) => {
          print('..................................'),
          print(value),
          emit(GetSuccess(value))
        }).onError((error, stackTrace) => {
          emit(GetFailed()),
          print(error)

        });
      }

    });
  }
}