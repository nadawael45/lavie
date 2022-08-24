import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'custom_text.dart';
class CustomAppBar extends StatelessWidget {
  CustomAppBar({
    this.text,this.width, Key? key,
  }) : super(key: key);
  String? text;
  double? width;

  @override
  Widget build(BuildContext context) {
    return Row(

      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: BackButton(color: Colors.black,),
        ),
        SizedBox(width: width??0.3.sw,),
        CustomText(text: text,fontWeight: FontWeight.bold,txtSize: 18,),
      ],
    );
  }
}
