import 'package:get/instance_manager.dart';
import '../controller/authcontroller.dart';
import '../controller/bottom_nav_controller.dart';

class InitBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(BottomNavController(),permanent:true);
    Get.put(AuthController(),permanent:true);
  }}