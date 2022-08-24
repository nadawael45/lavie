import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lavie/shared/constants/colors/colors.dart';
import 'custom_text.dart';
// ignore: must_be_immutable
class CustomTextFormField extends StatelessWidget {
  var controller;
  var validate;
  var function;
  String? text;
  CustomTextFormField({Key? key,this.controller, this.validate,this.function,this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(text: text,textAlign: TextAlign.start,color: ColorsManager.greyColor,txtSize: 10.sp,),
        Padding(padding:  EdgeInsets.only(bottom:5.sp),),
        SizedBox(
         // height: 42.sp,
          width: MediaQuery.of(context).size.width,
          child: TextFormField(

            cursorColor: ColorsManager.primaryColor,

            validator: validate,
            controller: controller,
            decoration: InputDecoration(
              contentPadding:EdgeInsets.symmetric(vertical: 0,horizontal: 7),
              focusedBorder:OutlineInputBorder(
                borderSide: const BorderSide(color: ColorsManager.primaryColor,),
                borderRadius: BorderRadius.circular(5),
              ),
              border: OutlineInputBorder(
                borderSide: const BorderSide(color: ColorsManager.greyColor, width: 3.0,),
                borderRadius: BorderRadius.circular(5),



              ) ,
          ),

        ),
        )
      ],
    );
  }
}
