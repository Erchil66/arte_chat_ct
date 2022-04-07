import 'package:chat/controllers/controller_user_model.dart';
import 'package:chat/services/firebase_services_collection/firebase_collection_stream.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  final fixName = Firebaseconstant.firebaseAuth.currentUser!.email;
  final controllerRx = Get.find<ControlleruserRx>();

  @override
  void onInit() {
    getUser();
    super.onInit();
  }

  getUser() {
    controllerRx.getUserDetails();
    update();
  }
}
