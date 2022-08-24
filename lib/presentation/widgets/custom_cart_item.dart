import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lavie/domain/cubit/cart/cart_cubit.dart';
import 'package:lavie/presentation/widgets/custom_text.dart';
import 'package:lavie/shared/constants/colors/colors.dart';
class CustomCartItem extends StatelessWidget {
   CustomCartItem({this.name,this.img,this.price,this.quantity,this.functionDelete,this.functionDecrement,this.functionIncrement,Key? key}) : super(key: key);
  String? img,name;
  int? quantity=0;
  int? price;
  var functionDelete;
   var functionIncrement;
   var functionDecrement;



   @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(left: 30,right: 30,top: 25),
      child: SizedBox(
        height: 160,
        width: 1.sw,
        child: Card(elevation: 8,child: Padding(
          padding: const EdgeInsets.all(18),
          child: Row(children: [
            Container(color: Colors.transparent,height: 130,width: 0.3.sw,
              child: img==''?SizedBox():Image.network(img!,fit: BoxFit.fill,),),
            const SizedBox(width: 20,),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 14),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(text: name,fontWeight: FontWeight.bold,txtSize: 16,),
                    CustomText(color: ColorsManager.primaryColor,text: '$price',fontWeight: FontWeight.bold,txtSize: 12,),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            InkWell(onTap: functionIncrement,
                                child: Container(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 3,horizontal: 7),
                                    child: CustomText(text: '+',txtSize: 15,),
                                  ),
                                  decoration: BoxDecoration(color: Colors.grey[200],borderRadius: BorderRadius.circular(5)),

                                )),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8.0),
                              child: CustomText(text: '$quantity',),
                            ),
                            InkWell(onTap: functionDecrement,
                                child: Container(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 3,horizontal: 7),
                                    child: CustomText(text: '-',txtSize: 15,),
                                  ),
                                  decoration: BoxDecoration(color: Colors.grey[200],borderRadius: BorderRadius.circular(5)),

                                )),
                          ],
                        ),
                        Spacer(),
                        InkWell(onTap:functionDelete,child: Icon(Icons.delete,color: ColorsManager.primaryColor,))




                      ],
                    ),





                  ],),
              ),
            )

          ],),
        ),),
      ),
    );
  }
}
