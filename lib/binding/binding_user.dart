import 'package:chat/controllers/controller_user_model.dart';
import 'package:chat/controllers/login_signup_controller.dart';
import 'package:get/get.dart';

class BindUser implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ControlleruserRx(), fenix: true);
  }
}
