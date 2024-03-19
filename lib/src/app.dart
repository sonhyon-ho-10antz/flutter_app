import 'package:flutter/material.dart';
import 'package:insta_flutter/src/components/image_data.dart';
import 'package:insta_flutter/src/controller/bottom_nav_controller.dart';
import 'package:get/get.dart';
import 'package:insta_flutter/src/pages/activeHistory.dart';
import 'package:insta_flutter/src/pages/home.dart';
import 'package:insta_flutter/src/pages/search.dart';
import 'package:insta_flutter/src/pages/mypage.dart';


class App extends GetView<BottomNavController> {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Obx(
            () => Scaffold(
              body: IndexedStack(
                index: controller.pageIndex.value,
                children: [
                  const Home(),
                  Navigator(
                    key: controller.searchPageNaviationKey,
                    onGenerateRoute: (routeSetting){
                      return MaterialPageRoute(
                          builder: (context)=> const Search(),
                      );
                    },
                  ),
                  Container(),
                  const ActiveHistory(),
                  const MyPage(),

                ],
              ),
              bottomNavigationBar: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                showSelectedLabels: false,
                showUnselectedLabels: false,
                currentIndex: controller.pageIndex.value,
                elevation: 0,
                onTap: controller.changeBottomNav,
                items: [
                  BottomNavigationBarItem(
                    icon: ImageData(IconsPath.homeOff),
                    activeIcon: ImageData(IconsPath.homeOn),
                    label:'home',
                  ),
                  BottomNavigationBarItem(
                    icon: ImageData(IconsPath.searchOff),
                    activeIcon: ImageData(IconsPath.searchOn),
                    label:'home',
                  ),
                  BottomNavigationBarItem(
                    icon: ImageData(IconsPath.uploadIcon),
                    label:'home',
                  ),
                  BottomNavigationBarItem(
                    icon: ImageData(IconsPath.activeOff),
                    activeIcon: ImageData(IconsPath.activeOn),
                    label:'home',
                  ),
                  BottomNavigationBarItem(
                    icon: Container(
                      width: 30,
                      height: 30,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey,
                      ),
                    ),
                    label:'home',
                  ),
                ],
              ),
            ),
        ),
        onWillPop: controller.willPopAction,
    );
  }
}