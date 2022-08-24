import '../api/api.dart';
import '../models/ToolsModel.dart';

class ToolsRepo{

 static Future< List <ToolsModel>> getTools(token)async{
    var response=await Api().getHttp(url: '/api/v1/tools',authToken: token
    );

    List<ToolsModel>toolsList=[];
    for(int i =0;i<response['data'].length;i++){
      ToolsModel toolsModel=ToolsModel.fromJson(response['data'][i]);
      toolsList.add(toolsModel);
//      print('///////////////////////');
//      print(response);
//      print(response['data'][1]);


    }

//    print(response['data'][0]['name']);
//    print(toolsList.length);
//    print(response.length);
//    print(toolsList);
    return toolsList;


  }

}