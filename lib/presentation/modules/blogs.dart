import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lavie/data/api/api.dart';
import 'package:lavie/domain/cubit/blogs/blogs_cubit.dart';
import 'package:lavie/domain/cubit/blogs/blogs_state.dart';
import 'package:lavie/presentation/modules/blog_details.dart';
import 'package:lavie/presentation/widgets/custom_appbar.dart';
import 'package:lavie/presentation/widgets/custom_text.dart';
import 'package:lavie/shared/constants/colors/colors.dart';
import 'package:lavie/shared/router.dart';
class Blogs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return
      SafeArea(
        child: Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10,),
              CustomAppBar(text: 'Blogs',),
              Expanded(
                child:  BlocConsumer<BlogsCubit, BlogsState>(
                    listener: (BuildContext context, state) {},
                    builder: (BuildContext context, Object? state) {
                      if(state is GetBlogSuccess){
                        return ListView.builder(
                          physics: const ScrollPhysics(),
                            itemCount: state.blogList.length,
                            itemBuilder: (context, index) => InkWell(
                              onTap: (){
                                MagicRouter.navigateTo(BlogsDetails(state.blogList[index]));
                              },
                              child: BlogItem(
                                time: '2 times ago',
                                name: state.blogList[index].name,
                                desc: state.blogList[index].description,
                                img: state.blogList[index].imageUrl==''?'':Api().baseUrl+state.blogList[index].imageUrl!,

                              ),
                            ));

                      }else{
                        return const Center(child: CircularProgressIndicator(color: ColorsManager.primaryColor,),);
                      }
                  }
                ),
              ),
            ],
          ),
        ),
      );
  }
}


class BlogItem extends StatelessWidget {
  String? time;
  String? name;
  String? desc;
  String? img;
BlogItem({this.desc,this.name,this.time,this.img});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 14),
      child: SizedBox(
        height: 160,
        width: 1.sw,
        child: Card(elevation: 8,child: Padding(
          padding: const EdgeInsets.all(14),
          child: Row(children: [
            Container(color: Colors.transparent,height: 130,width: 0.3.sw,
              child: img==''?SizedBox():Image.network(img!,fit: BoxFit.fill,),),
            const SizedBox(width: 20,),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10,),
                  CustomText(color: ColorsManager.primaryColor,text: time,fontWeight: FontWeight.bold,txtSize: 12,),
                const SizedBox(height: 10,),
                CustomText(text: name,fontWeight: FontWeight.bold,txtSize: 16,),
                const SizedBox(height: 10,),
                Expanded(child: CustomText(color: ColorsManager.greyColor,
                  textAlign: TextAlign.start,height: 1.5,
                  text: desc,lines: 2,txtSize: 11,)),




              ],),
            )

          ],),
        ),),
      ),
    );
  }
}
