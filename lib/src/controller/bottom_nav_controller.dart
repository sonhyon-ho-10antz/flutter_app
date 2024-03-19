import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../components/message_popup.dart';
import '../pages/upload.dart';

enum PageName{HOME,SERCH,UPLOAD,ACTIVITY,MYPAGE}
class BottomNavController extends GetxController{
  static BottomNavController get to => Get.find();
  RxInt pageIndex = 0.obs;
  GlobalKey<NavigatorState> searchPageNaviationKey = GlobalKey<NavigatorState>();

  List<int> bottomHistory = [0];
  void changeBottomNav(int value, {bool hasGesture = true}){
    var page = PageName.values[value];
    switch(page){
      case PageName.UPLOAD:
        Get.to(() => const Upload());
        break;
      case PageName.HOME:
      case PageName.SERCH:
      case PageName.ACTIVITY:
      case PageName.MYPAGE:
        _changePage(value,hasGesture :hasGesture);
        break;
    }
  }

  void _changePage(int value, {bool hasGesture = true}){
    pageIndex(value);
    if(!hasGesture) return;
    if(bottomHistory.last !=value){
      bottomHistory.add(value);
    }
  }

  Future<bool> willPopAction() async {
    if(bottomHistory.length==1){
      showDialog(context: Get.context!,
          builder: (context)=> MessagePopup(
            message: '시스템을 종료 하시겠습니까?',
            okCallback: (){
              exit(0);
            },
            cancelCallback: Get.back,
            title: '종료',
          )
      );
      return true;
    } else{
      var page = PageName.values[bottomHistory.last];
      if(page == PageName.SERCH){
        var value = await searchPageNaviationKey.currentState!.maybePop();
        if(value) return false;
      }


      bottomHistory.removeLast();
      var index = bottomHistory.last;
      changeBottomNav(index, hasGesture: false);
      return false;
    }
  }
}

