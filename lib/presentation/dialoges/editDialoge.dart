import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lavie/domain/cubit/profile/profile_cubit.dart';
import 'package:lavie/presentation/widgets/custom_textformfield.dart';

import '../../shared/constants/colors/colors.dart';
import '../widgets/custom_text.dart';
class EditDialoge extends StatelessWidget {
  String? title;
  Widget? widget;
  double? height;
  var function;
  EditDialoge({this.widget,this.title,this.height,this.function});
  @override
  Widget build(BuildContext context) {
    return
      BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
        child: Container(
          width: double.infinity,
          height:200 ,
          child:
          AlertDialog(
            title: CustomText(text: title,),
            content: widget,
            actions: <Widget>[
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Container(
                    height: 35.sp,
                    width: 50.sp,

                    decoration: BoxDecoration(
                      color:  ColorsManager.primaryColor,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: InkWell(onTap: function,
                          child: CustomText(text: 'OK',color: Colors.white,fontWeight: FontWeight.bold,)),
                    ),),
                ),
              ),


            ],
          )

          ),

      );
  }
}
showEditDialog(BuildContext context,String title,Widget widget,function){
  showDialog(context:context,builder: (builder)=> EditDialoge(title: title,widget: widget,function: function,) );
}

class NameDialog extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      child: Column(children: [
        SizedBox(height: 20,),
        CustomTextFormField(text: 'First Name',controller: ProfileCubit.get(context).firstNameController,),
        SizedBox(height: 20,),
        CustomTextFormField(text: 'Last Name',controller: ProfileCubit.get(context).lastNameController,),


      ],),
    );
  }
}

class EmailDialog extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Column(children: [
        SizedBox(height: 20,),
        CustomTextFormField(text: 'Email',controller: ProfileCubit.get(context).emailController,),



      ],),
    );
  }
}

