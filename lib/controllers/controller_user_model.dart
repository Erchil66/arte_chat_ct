import 'dart:developer';

import 'package:chat/models/user_model.dart';
import 'package:chat/routes/route_strings.dart';
import 'package:chat/services/firebase_services_collection/firebase_collection_stream.dart';
import 'package:get/get.dart';

class ControlleruserRx extends GetxController {
  final Rx<UserModel> users = UserModel().obs;
  getUserDetails() async {
    final result = await Firebaseconstant.getUserData(
        Firebaseconstant.firebaseAuth.currentUser!.uid);
    users(result);
    log(users.value.email.toString());
    update();
  }

  signOutUser() async {
    Firebaseconstant.firebaseAuth
        .signOut()
        .then((value) => Get.offNamedUntil(loginview!, (route) => false));
  }
}
