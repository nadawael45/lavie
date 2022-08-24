import 'dart:io';
import 'package:flutter/material.dart';
import 'package:lavie/shared/constants/keys/keys.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import '../models/cartModel.dart';
class DBHelper{

   DBHelper._();
  static final DBHelper _db=  DBHelper._();
  factory DBHelper(){
    return _db;
  }

    Database? _database;



   Future<Database> get db async{
    if(_database!=null)return _database!;
    _database=await initDB();
    return _database!;



  }
  initDB()async{
    Directory dir =await getApplicationDocumentsDirectory();
    String path= dir.path+'MyCart';
    print(dir);
    print(path);
    final cartList= await openDatabase(path,version: 1,onCreate: _onCreate);
    return cartList;
  }
void _onCreate(Database dB,int version) async{
    await dB.execute(
      'CREATE TABLE MyCart'
          '(${SqlKeys.id.name} INTEGER PRIMARY KEY AUTOINCREMENT,'
          '${SqlKeys.title.name}  TEXT,'
          '${SqlKeys.image.name}  TEXT,'
          '${SqlKeys.price.name}  TEXT,'
          '${SqlKeys.quantity.name}  TEXT)'


    );

}

//CRUD
insertTask(CartModel cartmodel)async{
Database dBB = await db;
dBB.insert('MyCart', cartmodel.toJson(),conflictAlgorithm: ConflictAlgorithm.replace);

 }

  deleteTask(CartModel cartmodel)async{
    Database dBB = await db;
    dBB.delete('MyCart',where:'${SqlKeys.id.name}=?' ,whereArgs:[cartmodel.id] );

  }
  updateQuantity(CartModel cartmodel,int quantity)async{
    Database dBB = await db;
    dBB.update('MyCart',{SqlKeys.quantity.name:quantity},where:'${SqlKeys.id.name}=?' ,whereArgs:[cartmodel.id] );

  }
  getAllCart()async{
    Database dBB = await db;
        List<Map<String,dynamic>>maps= await dBB.query('MyCart');
        return maps.map((e) => CartModel.fromJson(e)).toList();

  }
}