import 'package:flutter/material.dart';
import 'package:lavie/presentation/modules/home/units/cart_button.dart';
import 'package:lavie/presentation/modules/home/units/category_list.dart';
import 'package:lavie/presentation/modules/home/units/grid_view.dart';
import 'units/search_formField.dart';
import 'package:lavie/shared/constants/images/images.dart';

class Home extends StatelessWidget {

   Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
          backgroundColor: Colors.white,
          body:

      SafeArea(
        child: Column(children: [
          SizedBox(height: 30,),
          Image.asset(ImagesManager.logo),
          SizedBox(height: 30,),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 16),
            child: Row(children: [
              Expanded(child:
                  SearchFormField(),
              ),
              SizedBox(width: 10,),
              CartButton()
//            const SizedBox(width: 10,),
//            CustomButton('', (){})
            ],),
          ),
          SizedBox(height: 20,),
          CategoryList(),
          Expanded(child: CardGridView())


        ],),
      )
      );
  }
}
