import 'package:chat/controllers/controller_user_model.dart';
import 'package:get/get.dart';

class BindingChat implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ControlleruserRx(), fenix: true);
  }
}
