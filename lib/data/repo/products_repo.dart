import 'package:lavie/data/models/Data.dart';
import 'package:lavie/data/models/PlantModel.dart';

import '../api/api.dart';

class ProductRepo{

  static Future<List<Datum>> getAllPlants(token)async{
    var response=await Api().getHttp(url: '/api/v1/products',authToken: token
    );
    List<Datum> allplantsList=[];

    print(response);
    print(response['data'][0]['name']);
//    response['data'].forEach((i){
//      allplantsList.add(i);
//    });
    //response['data']
    for(int i =0;i<response['data'].length;i++){
      allplantsList.add(Datum.fromJson(response['data'][i]));
    }
    print(allplantsList.length);
    print(allplantsList);
    return allplantsList;


  }

}