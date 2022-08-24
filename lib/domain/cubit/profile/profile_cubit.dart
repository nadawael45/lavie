import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lavie/data/repo/blog_repo.dart';
import 'package:lavie/domain/cubit/blogs/blogs_state.dart';
import 'package:lavie/domain/cubit/profile/profile_state.dart';

import '../../../data/api/api.dart';
import '../../../data/local/cacheHelper.dart';
import '../../../shared/constants/keys/keys.dart';

class ProfileCubit  extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileLoading());

  static ProfileCubit get(context) => BlocProvider.of(context);
  Connectivity connectivity =  Connectivity();
 String name='';
 String? token;
  TextEditingController firstNameController=TextEditingController();
  TextEditingController lastNameController=TextEditingController();
  TextEditingController emailController=TextEditingController();

  getName(){
    name=CacheHelper.getString(SharedKeys.firstName)+' '+CacheHelper.getString(SharedKeys.lastName);
    print (name);
    print(CacheHelper.getString(SharedKeys.firstName));
    print(CacheHelper.getString(SharedKeys.lastName));

    print('////////////////////////////////');
    emit(GetName());
  }

  update(data)async
    {
      token=await CacheHelper.getString(SharedKeys.token);
      print(token);

      Api().putHttp(url: '/api/v1/user/me',data: data,authToken: token).then((value) => {
        print('//////////////////////////////'),
        print(value),
      name=CacheHelper.getString(SharedKeys.firstName)+' '+CacheHelper.getString(SharedKeys.lastName),

        emit(UpdateSuccess()),

        print('Success')

      }).onError((error, stackTrace) => {
        emit(UpdateFailed()),
        print('Failed'),
        print(error.toString()),
        print(token),




      });




  }
}