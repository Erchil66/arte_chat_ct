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
    result.removeWhere((e) =>
        e.userUid!.contains(Firebaseconstant.firebaseAuth.currentUser!.uid));
    userlist.assignAll(result);
    update();
  }

  actionToAdd(
      {String? usernamex,
      String? lastnamex,
      String? fistnamex,
      String? uiduser}) async {
    await Firebaseconstant.addUsertoChat(
        username: usernamex ?? "",
        lastname: lastnamex ?? "",
        firstname: fistnamex ?? "",
        type: "0",
        uidofUser: uiduser!,
        ownUID: Firebaseconstant.firebaseAuth.currentUser!.uid);
  }
}
