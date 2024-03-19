import 'package:get/get.dart';
import 'package:insta_flutter/src/repository/user_repository.dart';

import '../model/instagram_user.dart';

class AuthController extends GetxController{
  static AuthController get to =>Get.find();

  Rx<IUser> user  = IUser().obs;
  Future<IUser?>loginUser(String uid,)async{
   var userData = await UserRepository.loginUserByUid(uid);
   return userData;
  }

  void singup(IUser singupUser)async{
    var result = await UserRepository.signup(singupUser);
    if(result){
      user(singupUser);
    }
  }
}