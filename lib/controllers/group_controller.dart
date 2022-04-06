import 'package:chat/models/user_model.dart';
import 'package:chat/services/firebase_services_collection/firebase_collection_stream.dart';
import 'package:get/get.dart';

class GroupController extends GetxController {
  final List<UserModel> userlist = <UserModel>[].obs;

  @override
  void onReady() {
    getUsers();
    super.onReady();
  }

  getUsers() async {
    final result = await Firebaseconstant.getUser();
    userlist.assignAll(result);
    update();
  }
}
