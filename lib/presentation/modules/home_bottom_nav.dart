import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lavie/data/local/cacheHelper.dart';
import 'package:lavie/domain/cubit/blogs/blogs_cubit.dart';
import 'package:lavie/domain/cubit/forum/forum_cubit.dart';
import 'package:lavie/domain/cubit/profile/profile_cubit.dart';
import 'package:lavie/presentation/modules/blogs.dart';
import 'package:lavie/presentation/modules/forum.dart';
import 'package:lavie/presentation/modules/home/home_view.dart';
import 'package:lavie/presentation/modules/notification.dart';
import 'package:lavie/presentation/modules/profile.dart';
import 'package:lavie/presentation/modules/qr.dart';
import 'package:lavie/presentation/modules/register.dart';
import 'package:lavie/shared/constants/colors/colors.dart';
import 'package:lavie/shared/constants/images/images.dart';
import 'package:lavie/shared/constants/keys/keys.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
class HomeNavigation extends StatelessWidget {
  PersistentTabController controller= PersistentTabController(initialIndex: 0);

  HomeNavigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      onItemSelected: (index)async{
        await CacheHelper.init();
        if(index==2){
          String token = CacheHelper.getString(SharedKeys.token);
          BlogsCubit.get(context).getBlogsCubit(token);
        }
        if(index==0){
          String token = CacheHelper.getString(SharedKeys.token);
          ForumCubit.get(context).getForumCubit(token);
        }
      },
      confineInSafeArea: true,
      backgroundColor: Colors.white, // Default is Colors.white.
      handleAndroidBackButtonPress: true, // Default is true.
      resizeToAvoidBottomInset: true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      stateManagement: true, // Default is true.
      hideNavigationBarWhenKeyboardShows: true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: Colors.white,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: ItemAnimationProperties( // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: ScreenTransitionAnimation( // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle: NavBarStyle.style15, // Choose the nav bar style with this property.
    );
  }
}

List<Widget> _buildScreens() {
  return [
   DiscussionForums(),
   QrView(),
    Home(),
    //NotificationView(),
    Blogs(),
    Profile(),


  ];
}


List<PersistentBottomNavBarItem> _navBarsItems() {
  return [
    PersistentBottomNavBarItem(
      icon: Image.asset(ImagesManager.leave),
    ),
    PersistentBottomNavBarItem(
      icon: Image.asset(ImagesManager.qr),
    ),
    PersistentBottomNavBarItem(
      icon: Image.asset(ImagesManager.home),
      activeColorPrimary: ColorsManager.primaryColor,
      inactiveColorPrimary: Colors.grey,
    ),
    PersistentBottomNavBarItem(
      icon: Image.asset(ImagesManager.bell),
    ),
    PersistentBottomNavBarItem(
      icon: SvgPicture.asset(ImagesManager.group),
    ),
  ];
}