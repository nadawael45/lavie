import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lavie/data/local/cacheHelper.dart';
import 'package:lavie/domain/cubit/auth/auth_cubit.dart';
import 'package:lavie/domain/cubit/blogs/blogs_cubit.dart';
import 'package:lavie/domain/cubit/cart/cart_cubit.dart';
import 'package:lavie/domain/cubit/forum/forum_cubit.dart';
import 'package:lavie/domain/cubit/home/home_cubit.dart';
import 'package:lavie/domain/cubit/profile/profile_cubit.dart';
import 'package:lavie/presentation/modules/register.dart';
import 'package:lavie/presentation/modules/splash.dart';
import 'package:lavie/shared/blocobserver.dart';
import 'package:lavie/shared/constants/colors/colors.dart';
import 'package:lavie/shared/constants/keys/keys.dart';
import 'package:lavie/shared/router.dart';

import 'domain/cubit/quantity/quantity_cubit.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  String token =CacheHelper.getString(SharedKeys.token);
  BlocOverrides.runZoned(
        () {
      runApp(
        
                 MultiBlocProvider(
              providers: [
                BlocProvider (create: (_) => HomeCubit()..changeColor(0)..getAllPlantCubit(token, 0)..getPlantCubit(token, 1)),
                BlocProvider (create: (_) => AuthCubit()),
                BlocProvider (create: (_) => BlogsCubit()..getBlogsCubit(token)),
                BlocProvider (create: (_) => ProfileCubit()..getName()),
                BlocProvider (create: (_) => CartCubit()..getCart()),
                BlocProvider (create: (_) => QuantityCubit()),
                BlocProvider (create: (_) => ForumCubit()..getForumCubit(token)),










              ],
              child: const MyApp()
          )

  );
    },
    blocObserver: SimpleBlocObserver(),
  );


}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          navigatorKey: navigatorKey,
          onGenerateRoute: onGenerateRoute,
          theme: ThemeData(

            // primarySwatch: Colors.blue,
            primaryColor: ColorsManager.primaryColor,

          ),
          home:  SplashScreen(nextScreen: Register(),),
        );
      },
    );
  }
}


