import 'package:chat/controllers/chat_controller.dart';
import 'package:chat/controllers/controller_user_model.dart';
import 'package:chat/controllers/group_controller.dart';
import 'package:chat/controllers/post_controller.dart';
import 'package:chat/controllers/profile_controller.dart';
import 'package:get/get.dart';

class BindingMainHome implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ChatController(), fenix: true);
    Get.lazyPut(() => PostController(), fenix: true);
    Get.lazyPut(() => GroupController(), fenix: true);
    Get.lazyPut(() => ProfileController(), fenix: true);
    Get.lazyPut(() => ControlleruserRx(), fenix: true);
  }
}
