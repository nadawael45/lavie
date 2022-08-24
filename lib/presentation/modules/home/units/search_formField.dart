import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lavie/domain/cubit/home/home_cubit.dart';
import 'package:lavie/presentation/modules/home/search.dart';
import 'package:lavie/shared/constants/colors/colors.dart';
import 'package:lavie/shared/router.dart';
// ignore: must_be_immutable
class SearchFormField extends StatelessWidget {
  bool readOnly;
  SearchFormField({Key? key,this.readOnly=true}) : super(key: key);
  TextEditingController controller=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 42.sp,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),
        color: Colors.grey[100],
      ),
      child: TextFormField(

   controller: controller,
        cursorColor: ColorsManager.primaryColor,
          readOnly: readOnly,
        onTap: (){
          readOnly==true?MagicRouter.navigateTo(SearchView()):null;
        },
        onChanged: (v){
          HomeCubit.get(context).search(v);
        },
        decoration: const InputDecoration(
          hintText: 'Search',
          prefixIcon: Icon(Icons.search,color: Colors.grey,),
          focusedBorder:InputBorder.none,
          enabledBorder: InputBorder.none

        ),

      ),
    );
  }
}