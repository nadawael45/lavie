import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

class Api{
   String baseUrl='https://lavie.orangedigitalcenteregypt.com';

   Future<dynamic> getHttp({required url,  data,authToken})async{
     try{

       var response=await Dio().get(baseUrl+'$url',options:
           Options(headers:{
           "Authorization":"Bearer $authToken"
           } ),
         queryParameters: data

     );

       if(response.statusCode==200){return  response.data;}
    }on DioError catch(e){
     print('------------------------');
     print(e.response);
     print(e.response!.data['message']);

     }
  }

   Future<dynamic> postHttp({required url, required data,authToken,queryParams })async{

    try{
      var response=await Dio().post(baseUrl+'$url',data: data,queryParameters:queryParams,options:
      Options(headers:{
        "Authorization":"Bearer $authToken"
      }, )
      );
      if(response.statusCode==200){
        print('-----------------------');
        print(response.data);
        return  response.data;
      }

    }on DioError catch(e){
      print('------------------------');
      print(e.response);
      print(e.response!.data['message']);

    }
   }

   Future<dynamic> putHttp({required url, required data,authToken })async{

     try{
       var response=await Dio().patch(baseUrl+'$url',data: data,options:
       Options(headers:{
         "Authorization":"Bearer $authToken"
       } )
       );
       if(response.statusCode==200){
         print('-----------------------');
         print('success');
         print(response.data);
         return  response.data;
       }

     }on DioError catch(e){
       print('------------------------');
       print('faied');

       print(e.response);
       print(e.response!.data['message']);

     }
   }


}
