
import 'package:lavie/data/models/cartModel.dart';

abstract class CartState{}

class CartLoading extends CartState{}

class GetCartSuccess extends CartState{

  final List<CartModel>cartList;
  GetCartSuccess(this.cartList);
}

class GetCartFailed extends CartState{

  final String msg;
  GetCartFailed(this.msg);
}

class AddCartSuccess extends CartState{}
class AddCartFailed extends CartState{}




