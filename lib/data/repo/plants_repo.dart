import 'package:lavie/data/models/PlantModel.dart';
import 'package:lavie/data/models/SeedsModel.dart';

import '../api/api.dart';

class PlantsRepo{

  static Future< List <PlantModel>> getPlants(token)async{
    var response=await Api().getHttp(url: '/api/v1/plants',authToken: token
    );

    List<PlantModel>plantsList=[];
    for(int i =0;i<response['data'].length;i++){
      PlantModel seedsModel=PlantModel.fromJson(response['data'][i]);
      plantsList.add(seedsModel);

    }

    return plantsList;


  }

}