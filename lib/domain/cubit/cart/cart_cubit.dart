import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lavie/data/models/cartModel.dart';
import 'package:lavie/data/repo/blog_repo.dart';
import 'package:lavie/domain/cubit/blogs/blogs_state.dart';

import '../../../data/local/sql_helper.dart';
import 'cart_state.dart';

class CartCubit  extends Cubit<CartState> {
  CartCubit() : super(CartLoading());

  static CartCubit get(context) => BlocProvider.of(context);
  Connectivity connectivity =  Connectivity();

  DBHelper dbHelper = DBHelper();
  num total=0;

  getCart() {

        dbHelper.getAllCart().then((v) {
          emit(GetCartSuccess(v))  ;
          print(v);
          print('getcart');
          getTotal(v);

  });
  }
  addCart(CartModel cartModel) {
    dbHelper.insertTask(cartModel).then((v) {
      emit(AddCartSuccess());
      print('done');
      print(v);
      getCart();
    });

  }
  deleteCart(CartModel cartModel) {
    dbHelper.deleteTask(cartModel).then((v) {
      print('done');
      getCart();

    });

  }
  updateCart(CartModel cartModel,int quantity){

dbHelper.updateQuantity(cartModel, quantity).then((v) {
  print('done');
  print(v);
});

  }

  increment(cartlistIndex,cartlist){
    cartlistIndex.quantity++;
    updateCart(cartlistIndex, cartlistIndex.quantity);
    getTotal(cartlist);
    getCart();
  }
  decrement(cartlistIndex,cartlist){
    if(cartlistIndex.quantity>=0) {
      cartlistIndex.quantity--;
    }
    updateCart(cartlistIndex, cartlistIndex.quantity);

    getTotal(cartlist);
    getCart();


    // getCart();
  }
  getTotal(cartList){
    for(var i=0;i<cartList.length;i++){

      total+=cartList[i].price!* cartList[i].quantity!;

    }

  }

}