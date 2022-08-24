import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lavie/presentation/widgets/custom_text.dart';
class CustomPlantIcon extends StatelessWidget {

  String img;
  String title1;
  String desc;


  CustomPlantIcon(this.img,this.desc,this.title1);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30,left: 30),
      child: Row(
        children: [
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              color: Colors.grey.shade700.withOpacity(0.8),

            ),
            child: Image.asset(img),
          ),
          SizedBox(width: 20,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            CustomText(txtSize: 15,text: desc,fontWeight: FontWeight.bold,color: Colors.white,),
            SizedBox(height: 5,),

            CustomText(txtSize: 14,text: title1,color: Colors.white,),

          ],)
        ],
      ),
    );
  }
}
