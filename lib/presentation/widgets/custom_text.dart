import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomText extends StatelessWidget {
  String? text;
  double?txtSize;
  FontWeight?fontWeight;
  Color? color;
  TextAlign textAlign;
  int? lines;
  double? height;

  CustomText({this.text, this.txtSize, this.fontWeight,this.lines,
    this.color ,this.height,
    this.textAlign=TextAlign.center});

  @override
  Widget build(BuildContext context) {

    return Text((text!),
        textAlign: textAlign,
        maxLines: lines,
        softWrap: true,

        style:  GoogleFonts.roboto(
          height: height??1,
          color: color,
          fontSize: txtSize,
          fontWeight: fontWeight,




        ));
  }
}
