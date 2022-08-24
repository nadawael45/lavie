import 'package:lavie/data/models/SeedsModel.dart';

import '../api/api.dart';

class SeedsRepo{

  static Future< List <SeedsModel>> getSeeds(token)async{
    var response=await Api().getHttp(url: '/api/v1/seeds',authToken: token);

    List<SeedsModel>seedsList=[];
    for(int i =0;i<response['data'].length;i++){
      SeedsModel seedsModel=SeedsModel.fromJson(response['data'][i]);
      seedsList.add(seedsModel);
//      print('///////////////////////');
//      print(response);
    }

   // print(response['data'][0]['name']);
    return seedsList;


  }

}