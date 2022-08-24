import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lavie/data/api/api.dart';
import 'package:lavie/data/models/PlantModel.dart';
import 'package:lavie/presentation/modules/blogs.dart';
import 'package:lavie/presentation/widgets/custom_button.dart';
import 'package:lavie/presentation/widgets/custom_plant_icon.dart';
import 'package:lavie/shared/router.dart';

import '../../shared/constants/images/images.dart';
import '../widgets/custom_text.dart';
class QrDetails extends StatelessWidget {
  var listindex;
  QrDetails(this.listindex);
  @override
  Widget build(BuildContext context) {
    return
      Scaffold(body:  Stack(
        clipBehavior: Clip.none,
        children: [


          SizedBox(
            height: 0.45.sh,
            child: Stack(
              fit: StackFit.expand,
              children: [
                listindex.imageUrl==''?SizedBox():
                Image.network(Api().baseUrl+listindex.imageUrl, fit: BoxFit.fill),
                Container(
                    color: Colors.grey.withOpacity(0.1),
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 20,),
                      CustomPlantIcon(ImagesManager.temp, listindex.sunLight.toString(), 'Sun Light'),
                        CustomPlantIcon(ImagesManager.water, listindex.waterCapacity.toString(), 'Water Capacity'),
                        CustomPlantIcon(ImagesManager.thermometer, listindex.temperature.toString(), 'Temperature'),

                      ],
                    )
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: 1.sw,
              height: 0.58.sh,
              decoration:
              BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),topRight: Radius.circular(30)
                ),


              ),
              child: Padding(
                padding: const EdgeInsets.all(25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20,),
                    CustomText(fontWeight: FontWeight.bold,text: listindex.name,txtSize: 18,textAlign: TextAlign.start,),
                    Expanded(
                      child: ListView(
                        physics: ScrollPhysics(),
                        children: [  CustomText(
                          height: 1.5,
                          textAlign: TextAlign.start,
                          text: listindex.description
                          ,color: Colors.grey,txtSize: 13,

                        ),
                        ],),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 20),
                      child: CustomButton('Go To Blogs', (){MagicRouter.navigateTo(Blogs());}),
                    )
                  ],
                ),
              ),

            ),
          ),


        ],
      ));
  }
}
