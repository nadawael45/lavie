
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:lavie/data/api/api.dart';
import 'package:lavie/data/local/cacheHelper.dart';
import 'package:lavie/data/models/ToolsModel.dart';
import 'package:lavie/data/repo/plants_repo.dart';
import 'package:lavie/data/repo/products_repo.dart';
import 'package:lavie/data/repo/seeds_repo.dart';
import 'package:lavie/data/repo/tools_repo.dart';
import 'package:lavie/domain/cubit/auth/auth_cubit.dart';
import 'package:lavie/domain/cubit/home/home_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lavie/shared/constants/keys/keys.dart';

import '../../../data/models/Data.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeLoading());

  static HomeCubit get(context) => BlocProvider.of(context);

  List listBoolCategory = List.filled(4, false);
  Connectivity connectivity = Connectivity();


  changeColor(index) {
    listBoolCategory = List.filled(4, false);
    listBoolCategory[index] = true;
    emit(ChangeColor());
  }

  getToolsCubit(token, index) {
    connectivity.checkConnectivity().then((value) async {
      if (ConnectivityResult.none == value) {
        emit(GetToolsFailed("Check your internet connection and try again"));
      } else if (index == 3) {
        ToolsRepo.getTools(token).then((value) =>
        {
          print('..................................'),
          print(value),
          emit(GetToolsSuccess(value))
        }).onError((error, stackTrace) =>
        {
          emit(GetToolsFailed(error.toString())),
          print(error)
        });
      }
    });
  }

  getSeedsCubit(token, index) {
    connectivity.checkConnectivity().then((value) async {
      if (ConnectivityResult.none == value) {
        emit(GetSeedsFailed("Check your internet connection and try again"));
      } else if (index == 2) {
        SeedsRepo.getSeeds(token).then((value) =>
        {
          print('..................................'),
          print(value),

          emit(GetSeedsSuccess(value))
        })
            .onError((error, stackTrace) =>
        {
          emit(GetSeedsFailed(error.toString())),
          print(error)
        });
      }
    });
  }

  getPlantCubit(token, index) {
    connectivity.checkConnectivity().then((value) async {
      if (ConnectivityResult.none == value) {
        emit(GetPlantFailed("Check your internet connection and try again"));
      } else if (index == 1) {
        PlantsRepo.getPlants(token).then((value) =>
        {
          print('..................................'),
          print(value),
          emit(GetPlantSuccess(value))
        }).onError((error, stackTrace) =>
        {
          emit(GetPlantFailed(error.toString())),
          print(error.toString()),
        });
      }
    });
  }

  getAllPlantCubit(token, index) {
    print('plantallcubit');
    connectivity.checkConnectivity().then((value) async {
      if (ConnectivityResult.none == value) {
        emit(GetAllPlantFailed("Check your internet connection and try again"));
      } else if (index == 0) {
        ProductRepo.getAllPlants(token).then((value) =>
        {
          print('..................................'),
          print(value),
          emit(GetAllPlantSuccess(value))
        }).onError((error, stackTrace) =>
        {
          emit(GetAllPlantFailed(error.toString())),
          print(error)
        });
      }
    });
  }



    void search(String val) async{
    String token=CacheHelper.getString(SharedKeys.token);
      var response=await Api().getHttp(url: '/api/v1/products',authToken: token
      );
    print(response);
    List<Datum>dataList = [];
    response['data'].forEach((i) {
          i['name'].toString().contains(val)
              ? dataList.add(Datum.fromJson(i))
              : null;
        });
        emit(SearchSuccessState(dataList));
        print(dataList.length);
  }



}