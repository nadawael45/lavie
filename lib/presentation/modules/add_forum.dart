import 'dart:convert';
import 'dart:io'as Io;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lavie/data/models/ForumModel.dart';
import 'package:lavie/domain/cubit/forum/forum_cubit.dart';
import 'package:lavie/presentation/dialoges/pick_image.dart';
import 'package:lavie/presentation/widgets/custom_appbar.dart';

import '../../domain/cubit/forum/forum_state.dart';

class NewPost extends StatelessWidget {
   NewPost({Key? key}) : super(key: key);
TextEditingController titleController=TextEditingController();
  TextEditingController descController=TextEditingController();

var image;
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child:
          BlocConsumer<ForumCubit,ForumState>(
listener:(BuildContext context, Object? state) {
  if( state is AddSuccess){
    titleController.text='';
    descController.text='';
    image=null;

  }
} ,
              builder: (BuildContext context, Object? state) {
                if(state is ImageCamera){
                  image=  ForumCubit.get(context).image;
                }
                if(state is ImageGallery){
                  image=  ForumCubit.get(context).image;

                }
              return Column
                (
                children: [
                  SizedBox(height: 10,),
                  CustomAppBar(text: 'Create New Post',width: 0.2.sw,),
                  Padding(
                    padding: const EdgeInsets.only(top: 61.0),
                    child: Center(
                      child:
                      InkWell(
                        onTap: (){
                          showDialog(context: context, builder: (builder)=> PickImageDialoge());


                        },
                        child: Container(
                          height: 136,
                          width: 136,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.green),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Center(
                            child:image==null? Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Icon(
                                  Icons.add,
                                  size: 28,
                                  color: Colors.green,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 8.0),
                                  child: Text(
                                    'Add photo ',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.green),
                                  ),
                                )
                              ],
                            ):
                            Image.file(image,fit: BoxFit.fill,)
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10,right: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding:
                          EdgeInsets.only(top: 13.0, left: 8, right: 8, bottom: 8),
                          child: Text('Title'),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            controller: titleController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5)),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10,right: 10),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                        const Padding(
                        padding:

                        EdgeInsets.only(top: 13.0, left: 8, right: 8, bottom: 8),
                    child: Text('Description'),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: descController,
                      maxLines: 6,
                      decoration: InputDecoration(

                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5)),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
        ),
        InkWell(
              onTap: (){
              print('post');
              ForumCubit.get(context).addForum(ForumModel(title: titleController.text,
                description: descController.text,imageBase64:convertImage(context),
              ));
              },
              child: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Container(
                  height: 54,
                  width: MediaQuery.of(context).size.width*.7,
                  decoration: BoxDecoration(color: Colors.green,
                    borderRadius: BorderRadius.circular(10),
                  ),

                  child: const Center(
                    child: Text('Post',style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.w500),),
                  ),
                ),
              ),
        )
        ],
      );
            }
          ),
    ),
    ),
    );
  }
}
 convertImage(context){
   final bytes = ForumCubit.get(context).image.readAsBytesSync();
   String img64 = "data:image/png;base64,"+base64Encode(bytes);


   return img64;
 }