import 'package:lavie/data/models/Data.dart';
import 'package:lavie/data/models/PlantModel.dart';
import 'package:lavie/data/models/ToolsModel.dart';

import '../../../data/models/SeedsModel.dart';

abstract class HomeStates {
}
class HomeLoading extends HomeStates{}
class ChangeColor extends HomeStates{}
class GetToolsSuccess extends HomeStates{

  final List<ToolsModel>toolList;
  GetToolsSuccess(this.toolList);
}
class GetSeedsSuccess extends HomeStates{

  final List<SeedsModel>seedsList;
  GetSeedsSuccess(this.seedsList);
}
class GetPlantSuccess extends HomeStates{

  final List<PlantModel>plantList;
  GetPlantSuccess(this.plantList);
}
class GetPlantFailed extends HomeStates{

  final String msg;
  GetPlantFailed(this.msg);
}
class GetToolsFailed extends HomeStates{

  final String msg;
  GetToolsFailed(this.msg);
}
class GetSeedsFailed extends HomeStates{

  final String msg;
  GetSeedsFailed(this.msg);
}

class GetAllPlantSuccess extends HomeStates{

  final List<Datum>allplantList;
  GetAllPlantSuccess(this.allplantList);
}
class GetAllPlantFailed extends HomeStates{

  final String msg;
  GetAllPlantFailed(this.msg);
}

class SearchSuccessState extends HomeStates{
  List<Datum>dataList=[] ;
  SearchSuccessState(this.dataList);
}

class Increase extends HomeStates{}
