import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:lavie/shared/constants/images/images.dart';

class SplashScreen extends StatelessWidget {
  final Widget? nextScreen;

  const SplashScreen({Key? key, this.nextScreen}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body:  AnimatedSplashScreen(
          duration: 4000,
          splashIconSize:350 ,
          splash: Image.asset(ImagesManager.logo),
          nextScreen: nextScreen!,
          splashTransition: SplashTransition.fadeTransition,
          backgroundColor:Colors.white,


        ));
  }


}
