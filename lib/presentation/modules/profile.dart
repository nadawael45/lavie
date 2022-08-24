import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lavie/data/local/cacheHelper.dart';
import 'package:lavie/domain/cubit/profile/profile_cubit.dart';
import 'package:lavie/domain/cubit/profile/profile_state.dart';
import 'package:lavie/presentation/dialoges/editDialoge.dart';
import 'package:lavie/presentation/widgets/custom_text.dart';
import 'package:lavie/shared/constants/images/images.dart';
import 'package:lavie/shared/constants/keys/keys.dart';

import '../../data/api/api.dart';
class Profile extends StatelessWidget {
  String name ='';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:
        BlocConsumer<ProfileCubit, ProfileState>(
            listener: (BuildContext context, state) {},
            builder: (BuildContext context, Object? state) {
              if(state is UpdateSuccess)
                {
                  name= ProfileCubit.get(context).name;

                }
              if(state is GetName){
                name= ProfileCubit.get(context).name;
                print(name);
                print(ProfileCubit.get(context).name);
              }


            return Stack(
             clipBehavior: Clip.none,
            children: [


              SizedBox(
                height: 0.4.sh,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.asset(ImagesManager.profile, fit: BoxFit.cover),
                    ClipRRect( // Clip it cleanly.
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                        child: Container(
                            color: Colors.grey.withOpacity(0.1),
                            alignment: Alignment.center,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CircleAvatar(radius: 65,backgroundImage: AssetImage(ImagesManager.profile),),
                                SizedBox(height: 25,),
                                CustomText(color: Colors.white,fontWeight: FontWeight.bold,text: name,txtSize: 20,)
                              ],
                            )
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: 1.sw,
                  height: 0.58.sh,
                  decoration:
                  BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),topRight: Radius.circular(30)
                      ),


                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(25),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                      SizedBox(height: 10,),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          color: Colors.grey[200]
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Row(children: [
                            Container(
                              height:45,
                              width: 45,
                              child: Icon(Icons.star,color: Colors.orange,),
                              decoration: BoxDecoration(

                                border: Border.all(width: 3,color: Colors.orange),
                                color: Colors.green.shade600,
                                borderRadius: BorderRadius.circular(50)
                              ),
                            ),
                            SizedBox(width: 20,),
                            CustomText(text: 'you have 30 points',fontWeight: FontWeight.w400,)
                          ],),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 24),
                        child: CustomText(text: 'Edit Profile',fontWeight: FontWeight.normal,txtSize: 18,),
                      ),
                      InkWell(onTap:(){
                        showEditDialog(context,'Edit Email',EmailDialog(),()=>
                          editEmailFunction(context));
                        },child: ProfileContainer(text: 'Edit Email',)),
                      SizedBox(height: 20,),
                      InkWell(onTap: (){showEditDialog(context,'Edit Name',NameDialog(),()=>editNameFunction(context));},
                          child: ProfileContainer(text: 'Edit Name',))

                    ],),
                  ),
                ),
              ),


            ],
      );
         }
       ),
    );
  }
}

class ProfileContainer extends StatelessWidget {
  String? text;

  ProfileContainer({this.text,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey)
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(children: [
          Image.asset(ImagesManager.change,),
          SizedBox(width: 20,),
          CustomText(text: text,),
          Spacer(),
          Icon(Icons.arrow_forward,color: Color(0xff1D592C),)
        ],),
      ),
    );
  }
}

editEmailFunction(context)async{
  ProfileCubit.get(context).update({
    'email':ProfileCubit.get(context).emailController.text
  });
  await CacheHelper.putString(SharedKeys.email, ProfileCubit.get(context).emailController.text);

  Navigator.of(context, rootNavigator: true).pop();
  print('editttttttttttttttttttttt');
//   ProfileCubit.get(context).getName();

}

editNameFunction(context)async{
  ProfileCubit.get(context).update({
    'firstName':ProfileCubit.get(context).firstNameController.text,
    'lastName':ProfileCubit.get(context).lastNameController.text
  });
  print('editttttttttttttttttttttt');
  await CacheHelper.putString(SharedKeys.firstName, ProfileCubit.get(context).firstNameController.text);
  await CacheHelper.putString(SharedKeys.lastName, ProfileCubit.get(context).lastNameController.text);
  Navigator.of(context, rootNavigator: true).pop();
//  ProfileCubit.get(context).getName();


}


