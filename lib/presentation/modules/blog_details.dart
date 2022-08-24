// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lavie/data/api/api.dart';
import 'package:lavie/data/models/BlogResponse.dart';
import 'package:lavie/data/models/BlogsModel.dart';
import 'package:lavie/presentation/widgets/custom_text.dart';
class BlogsDetails extends StatelessWidget {
  BlogsModel list;
  BlogsDetails(this.list);
  @override
  Widget build(BuildContext context) {
    return Scaffold(body:
      SizedBox(
        height: 1.sh,
        width: 1.sw,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 1.sw,
              height: 0.3.sh,
              color: Colors.black,
              child: list.imageUrl==''?SizedBox():Image.network(Api().baseUrl+list.imageUrl!),
            ),
            SizedBox(height: 20,),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 20,),
              child: CustomText(fontWeight: FontWeight.bold,text: list.name,txtSize: 18,textAlign: TextAlign.start,),
            ),

            Expanded(
              child: ListView(
                physics: ScrollPhysics(),
                children: [  Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: CustomText(
                  height: 2,
                  textAlign: TextAlign.start,
                  text: list.description
                  ,color: Colors.grey,txtSize: 13,

                ),
              ),
              ],),
            )

          ],
        ),
      ));
  }
}
