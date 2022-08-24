import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lavie/data/api/api.dart';
import 'package:lavie/domain/cubit/cart/cart_cubit.dart';
import 'package:lavie/domain/cubit/cart/cart_state.dart';
import 'package:lavie/presentation/widgets/custom_appbar.dart';
import 'package:lavie/presentation/widgets/custom_button.dart';
import 'package:lavie/presentation/widgets/custom_cart_item.dart';
import 'package:lavie/shared/constants/colors/colors.dart';

import '../widgets/custom_text.dart';

class Cart extends StatelessWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: 1.sw,
          height: 1.sh,
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              CustomAppBar(text: 'MyCart'),
              Expanded(
                child:  BlocConsumer<CartCubit, CartState>(
                    listener: (BuildContext context, state) {},
                    builder: (BuildContext context, Object? state) {
                      if(state is GetCartSuccess){
                        return ListView.builder(
                          itemCount: state.cartList.length,
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (context, index) {
                            print(state.cartList.length);
                            print(index);
                            return  CustomCartItem(
                              quantity: state.cartList[index].quantity,
                              img: state.cartList[index].img==''?'':Api().baseUrl+state.cartList[index].img!,
                              name: state.cartList[index].title,
                              price: state.cartList[index].price,
                              functionDelete: ()=> CartCubit.get(context).deleteCart(state.cartList[index]),
                              functionDecrement:(){
                                CartCubit.get(context).decrement(state.cartList[index],state.cartList);
                                print(state.cartList[index].quantity);
                                print('decrement');
                              } ,
                              functionIncrement:(){
                                CartCubit.get(context).increment(state.cartList[index],state.cartList);
                                print(state.cartList[index].quantity);
                                print('increment');

                              } ,

                            );
                          },
                        );

                      }
                    return Center(child: CircularProgressIndicator(color: ColorsManager.primaryColor,));
                  }
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(
                      height: 20,
                    ),

                    Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(text: 'Total',color: ColorsManager.greyColor,txtSize: 16,),
                      BlocConsumer<CartCubit, CartState>(
                          listener: (BuildContext context, state) {},
                          builder: (BuildContext context, Object? state) {
                          return CustomText(text: '${CartCubit.get(context).total}',color: ColorsManager.primaryColor,fontWeight: FontWeight.bold,);
                        }
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                    CustomButton('Checkout', (){}),
                    SizedBox(
                      height: 20,
                    ),

                  ],),
              ),


            ],
          ),
        ),
      ),
    );
  }
}

