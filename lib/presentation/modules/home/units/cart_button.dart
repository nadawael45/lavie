import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lavie/presentation/modules/cart.dart';
import 'package:lavie/shared/constants/colors/colors.dart';
import 'package:lavie/shared/router.dart';
class CartButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(onTap: (){

      MagicRouter.navigateTo(Cart());},
      child: Container(
        height: 42.sp,
        width: 42.sp,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: ColorsManager.primaryColor,

        ),
        child: Icon(Icons.shopping_cart,color: Colors.white,),
      ),
    );
  }
}
