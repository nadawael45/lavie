
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lavie/domain/cubit/forum/forum_cubit.dart';


class PickImageDialoge extends StatefulWidget {



  @override
  State<PickImageDialoge> createState() => _PickImageDialogeState();
}

class _PickImageDialogeState extends State<PickImageDialoge> {



  @override
  Widget build(BuildContext context) {
    return
      SimpleDialog(
              title: Text(('Select...'),),
              children: [
                SimpleDialogOption(
                    child: Text(('Pick From Camera'),),
                    onPressed: () {
                     ForumCubit.get(context).pickFromCamera(context);
                    }),
                SimpleDialogOption(
                    child: Text(('Pick From Gallery'),),
                    onPressed: () {
                      ForumCubit.get(context).pickFromGallery(context);
                    }),
              ],
            );

  }

//  showImageDialoge(){
//    showDialog(context: context, builder: (builder)=> PickImageDialoge(widget.pickedImg));
//  }
}
