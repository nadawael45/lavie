import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lavie/data/api/api.dart';
import 'package:lavie/domain/cubit/quantity/quantity_state.dart';
import 'package:lavie/presentation/modules/cart.dart';
import 'package:lavie/presentation/widgets/custom_button.dart';
import 'package:lavie/presentation/widgets/custom_text.dart';
import 'package:lavie/shared/router.dart';

import '../../data/models/cartModel.dart';
import '../../domain/cubit/cart/cart_cubit.dart';
import '../../domain/cubit/quantity/quantity_cubit.dart';

class CustomCard extends StatelessWidget {
  String? name;
  String? img;
  int price;
  int quantity;
  var toolsModel;
  var incrementFunc;
  var decremntFunc;
  var addToCart;
  CustomCard({this.toolsModel,this.quantity=0,this.img,this.price=200,this.name,
    this.decremntFunc,this.incrementFunc,this.addToCart});
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          width: 1.sw,
          height: 210,
          child: Card(
            elevation: 8,
            child: Padding(
              padding:  EdgeInsets.only(right: 18,left: 18,bottom: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

               Expanded(
                 child: Row(
                   crossAxisAlignment: CrossAxisAlignment.center,
                   children: [
                     Spacer(),
                     Row(
                       mainAxisAlignment: MainAxisAlignment.end,
                       children: [
                         InkWell(onTap: incrementFunc,
                             child: Container(
                               child: Padding(
                                 padding: const EdgeInsets.symmetric(vertical: 3,horizontal: 7),
                                 child: CustomText(text: '+',txtSize: 15,),
                               ),
                               decoration: BoxDecoration(color: Colors.grey[200],borderRadius: BorderRadius.circular(5)),

                             )),
                         Padding(
                           padding: const EdgeInsets.symmetric(horizontal: 8.0),
                           child: BlocConsumer<QuantityCubit,QuantityState>(
                             listener: (BuildContext context, state) {  },
                             builder: (BuildContext context, state) {
                               print('blovvvvvvvvvvvvvvvvvvvvvvvvvvv');
                               if(state is Increase){
                                 print(state.num);
                                // quantity=state.num.quantity;
                                 return CustomText(text: '$quantity',);

                               }
                               if(state is Decrease){
                                 return CustomText(text: '$quantity',);

                               }
                               return CustomText(text: '$quantity',);
                             },
                           ),
                         ),
                         InkWell(onTap: decremntFunc,
                             child: Container(
                               child: Padding(
                                 padding: const EdgeInsets.symmetric(vertical: 3,horizontal: 7),
                                 child: CustomText(text: '-',txtSize: 15,),
                               ),
                               decoration: BoxDecoration(color: Colors.grey[200],borderRadius: BorderRadius.circular(5)),

                             )),
                       ],
                     ),



                   ],
                 ),
               ),
                CustomText(text: name.toString().toUpperCase(),txtSize: 14,fontWeight: FontWeight.bold,),
                SizedBox(height: 5,),
                CustomText(text: price.toString(),txtSize: 12,),
                  SizedBox(height: 15,),

                  Align(alignment: Alignment.bottomCenter,
                    child: CustomButton('Add To Cart',
                          ()async{
                      await CartCubit.get(context).addCart(CartModel(title: name,img: img,price: price,quantity: quantity));

                            MagicRouter.navigateTo(Cart());
                    },height: 35,)),

              ],),
            ),
          ),
        ),
        Positioned(
           top: 30,
            left: 20,
            child: Align(alignment: Alignment.topLeft,
                child: img==''?
                Container(height: 150,width: 180,color: Colors.transparent,)
              : Image.network(Api().baseUrl+img!,height: 100,width: 80,fit: BoxFit.fill,))),

      ],
    );
  }
}
