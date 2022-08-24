import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lavie/data/local/cacheHelper.dart';
import 'package:lavie/domain/cubit/auth/auth_cubit.dart';
import 'package:lavie/domain/cubit/home/home_cubit.dart';
import 'package:lavie/domain/cubit/home/home_states.dart';
import 'package:lavie/presentation/widgets/custom_text.dart';
import 'package:lavie/shared/constants/colors/colors.dart';
import 'package:lavie/shared/constants/keys/keys.dart';

import '../../../../data/repo/tools_repo.dart';
class CategoryList extends StatelessWidget {
  const CategoryList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: SizedBox(
        height: 40.h,
        width: 1.sw,
        child:
        ListView.builder(
          scrollDirection: Axis.horizontal,
            itemCount: 4,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 40.h,
                  width: 0.2.sw,
                  child: BlocConsumer<HomeCubit, HomeStates>(
                      listener: (BuildContext context, state) {},
                      builder: (BuildContext context, Object? state) {



                        return InkWell(
                          onTap: ()async {
                            String? token;
                            token=  CacheHelper.getString(SharedKeys.token);
                            HomeCubit.get(context).changeColor(index);
                            listFunction(context: context,index: index,token: token);


                          },
                        child:categoryWidget(context,index) ,
                        );

                      }


                  ),
                ),
              );
            }

        ),
      ),
    );
  }
}

 categoryWidget(context,index){
   if (HomeCubit
       .get(context)
       .listBoolCategory[index] == true) {
     return Container(
       decoration: BoxDecoration(
           borderRadius: BorderRadius.circular(5),
           border: Border.all(
               color: ColorsManager.primaryColor),
           color: Colors.white),
       child: Center(
         child: CustomText(text: categories[index],
           color: ColorsManager.primaryColor,),
       ),
     );
   }

   else {
     return Container(

       decoration: BoxDecoration(
           borderRadius: BorderRadius.circular(5),
           color: Colors.grey[200]),
       child: Center(child: CustomText(text: categories[index],color: ColorsManager.greyColor,)),
     );
   }
 }

List<String>categories=[
  'All','Plants','Seeds','Tools'
];



listFunction({context,token,index}){
  List categoriesFunctions=[
    HomeCubit.get(context).getAllPlantCubit(token,index),
    HomeCubit.get(context).getPlantCubit(token,index),
    HomeCubit.get(context).getSeedsCubit(token,index),
    HomeCubit.get(context).getToolsCubit(token,index)];
  return categoriesFunctions[index];

}