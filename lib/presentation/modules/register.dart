import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lavie/data/models/UserModel.dart';
import 'package:lavie/domain/cubit/auth/auth_cubit.dart';
import 'package:lavie/domain/cubit/auth/auth_states.dart';
import 'package:lavie/presentation/modules/home_bottom_nav.dart';
import 'package:lavie/presentation/widgets/custom_button.dart';
import 'package:lavie/presentation/widgets/custom_text.dart';
import 'package:lavie/presentation/widgets/custom_textformfield.dart';
import 'package:lavie/shared/constants/colors/colors.dart';
import 'package:lavie/shared/constants/keys/keys.dart';
import 'package:lavie/shared/router.dart';
import 'package:lavie/shared/validator.dart';

import '../../data/local/cacheHelper.dart';
import '../../shared/constants/images/images.dart';

class Register extends StatefulWidget {
   Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
   int index =0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child:
          Column(
            children: [
              Align(
                  alignment: Alignment.topRight,
                  child: Image.asset(ImagesManager.tree)),
              Image.asset(ImagesManager.logo),
              SizedBox(height: 50.sp,),
              DefaultTabController(
                length: 2,
                initialIndex: index,
                child: Column(
                  children: [
                    TabBar(
                        onTap: (indexCurrent){
                        setState(() {
                          index=indexCurrent;
                        });
                        },
                        indicatorColor: ColorsManager.primaryColor,
                        labelColor: ColorsManager.primaryColor,
                        unselectedLabelColor: ColorsManager.greyColor,
                        labelPadding: const EdgeInsets.symmetric(vertical: 12,horizontal: 40),
                        padding: const EdgeInsets.symmetric(horizontal: 50),
                        indicatorPadding:const EdgeInsets.symmetric(horizontal: 50) ,
                        indicatorSize: TabBarIndicatorSize.tab,

                        tabs: [
                      CustomText(text: 'Sign up',txtSize: 12.sp,),
                      CustomText(text: 'Login',txtSize: 12.sp,),

                    ]),

                      SizedBox(
                             height: index==0?485:index==1?285:485,
                             child:  TabBarView(

                               physics: NeverScrollableScrollPhysics(),
                                children: [
                                TabViewSignUp(),
                                TabViewLogin(),

                                ]),
                           ),


                  ],
                ),
              ),
              Padding(
              padding:  EdgeInsets.only(right: 40.sp,bottom: 30.sp,left: 40.sp),
              child: Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                const Expanded(child: Divider(color: ColorsManager.greyColor)),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 3.sp),
                  child: CustomText(text:'or continue with',color: ColorsManager.greyColor,txtSize: 10.sp,),
                ),
                  const Expanded(child: Divider(color: ColorsManager.greyColor)),
              ],),
            ),
              Row(mainAxisAlignment: MainAxisAlignment.center,
              children: [
            InkWell(onTap: (){
              AuthCubit.get(context).signInWithGoogle();
            },
                child: Image.asset(ImagesManager.google)),
              SizedBox(width: 20.sp,),
              Image.asset(ImagesManager.facebook),

            ],),

              Align(
                alignment: Alignment.bottomLeft,
                child: Image.asset(ImagesManager.bottom_tree)),

            ],
          ),
        ),
      ),
    );
  }
}


class TabViewLogin extends StatelessWidget {
   TabViewLogin({Key? key}) : super(key: key);
  TextEditingController? emailController=TextEditingController();
   TextEditingController? passwordController=TextEditingController();
   GlobalKey<FormState> formKey =  GlobalKey<FormState>();
   String? token;


   @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit,AuthStates>(
      listener:(BuildContext context, Object? state)async{
        if(state is SignInSuccess||state is SignInGoogleSuccess||state is SignInSuccess|| state is SignUpSuccess){
          token=AuthCubit.get(context).token;

         await CacheHelper.init();

          CacheHelper.putString(SharedKeys.email, emailController!.text);
          CacheHelper.putString(SharedKeys.token, token);
          print(token);


          await MagicRouter.navigateAndPopAll(HomeNavigation());
          print('SignInSuccess');
        }
      } ,
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 40.sp),
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),

          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              CustomTextFormField(text: 'Email',controller: emailController,validate: Validator.validateEmail,),
              SizedBox(height: 20.sp,),
              CustomTextFormField(text: 'Password',controller: passwordController,validate: Validator.validatePassword,),
                Padding(
                  padding:  EdgeInsets.only(top: 20.sp),
                  child: CustomButton('Login', (){
                    if(formKey.currentState!.validate()){
                      AuthCubit.get(context).signIn(UserModel(email: emailController!.text,
                          password: passwordController!.text));
                    }

                      }

                  ),
                ),




              ],),
          ),
        ),
      ),
    );
  }
}
class TabViewSignUp extends StatelessWidget {
   TabViewSignUp({Key? key}) : super(key: key);
   TextEditingController? emailController=TextEditingController();
   TextEditingController? passwordController=TextEditingController();
   TextEditingController? firstNameController=TextEditingController();
   TextEditingController? lastNameController=TextEditingController();
   TextEditingController? confirmpasswordController=TextEditingController();
   GlobalKey<FormState> formKey =  GlobalKey<FormState>();
   String? token;


   @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit,AuthStates>(
      listener:(BuildContext context, Object? state)async{
        if(state is SignUpSuccess){
          token=AuthCubit.get(context).token;
        await  CacheHelper.init();
          CacheHelper.putString(SharedKeys.email, emailController!.text);
          CacheHelper.putString(SharedKeys.firstName, firstNameController!.text);
          CacheHelper.putString(SharedKeys.lastName, lastNameController!.text);
          CacheHelper.putString(SharedKeys.token, token);
          print(token);






          await MagicRouter.navigateAndPopAll(HomeNavigation());
          print('SignUpSuccess');
        }
      } ,
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 40.sp),
        child: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 20.sp,),
                Row(
                  children: [

                    Expanded(child: CustomTextFormField(text: 'First Name',controller: firstNameController,validate: Validator.validateEmpty,)),
                    SizedBox(width: 20.sp,),

                    Expanded(child: CustomTextFormField(text: 'Last Name',controller: lastNameController,validate: Validator.validateEmpty)),

                  ],
                ),
                SizedBox(height: 20.sp,),
                CustomTextFormField(text: 'Email',controller: emailController,validate: Validator.validateEmail,),
                SizedBox(height: 20.sp,),
                CustomTextFormField(text: 'Password',controller: passwordController,validate: Validator.validatePassword,),
                SizedBox(height: 20.sp,),
                CustomTextFormField(text: 'Confirm Password',controller: confirmpasswordController,validate: Validator.validateConfirmPass(confirmpasswordController!.text, passwordController!.text),),
                Padding(
                  padding:  EdgeInsets.only(top: 20.sp),
                  child: CustomButton('Sign Up', (){
                    if(formKey.currentState!.validate()){
                      AuthCubit.get(context).signUp(UserModel(
                          firstName: firstNameController!.text,
                          lastName: lastNameController!.text,
                          email: emailController!.text,
                          password: passwordController!.text
                      ));

                    }


                      }



                  ),
                ),




              ],),
          ),
        ),
      ),
    );
  }
}

