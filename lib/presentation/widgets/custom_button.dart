import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lavie/presentation/widgets/custom_text.dart';
import 'package:lavie/shared/constants/colors/colors.dart';
class CustomButton extends StatelessWidget {
  String? text;
  var function;
  double? height;

  CustomButton(this.text, this.function,{this.height});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: function,
      child: Container(
        width: MediaQuery.of(context).size.width,
           height: height??42.sp,
           decoration: BoxDecoration(
             color: ColorsManager.primaryColor,
             borderRadius: BorderRadius.circular(7),

           ),
          child: Center(
            child: CustomText(text: text,fontWeight: FontWeight.bold,color: Colors.white,txtSize: 12.sp,
            ),
          )),
    );
  }
}
