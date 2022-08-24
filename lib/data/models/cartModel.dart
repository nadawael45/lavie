import 'package:lavie/shared/constants/keys/keys.dart';

class CartModel{

String? img,title;
int? quantity,id,price;


CartModel({this.title, this.img, this.quantity, this.price,this.id});


toJson(){
  return{
    SqlKeys.id.name:id,
    SqlKeys.title.name:title,
    SqlKeys.quantity.name:quantity,
    SqlKeys.price.name:price,
    SqlKeys.image.name:img,


  };
}
CartModel.fromJson(Map<String,dynamic>taskMap){
  id=taskMap[SqlKeys.id.name];
  title=taskMap[SqlKeys.title.name]??'';
  quantity=int.parse(taskMap[SqlKeys.quantity.name]??'');
  price=int.parse(taskMap[SqlKeys.price.name]??'');
  img=taskMap[SqlKeys.image.name]??'';

}}