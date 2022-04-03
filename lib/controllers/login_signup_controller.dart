import 'dart:async';
import 'dart:developer';

import 'package:chat/controllers/controller_user_model.dart';
import 'package:chat/models/user_model.dart';
import 'package:chat/routes/route_strings.dart';
import 'package:chat/services/firebase_services_collection/firebase_collection_stream.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginSignUpController extends GetxController {
  final controllerRx = Get.find<ControlleruserRx>();
  final logintextController = TextEditingController(),
      passwordtextController = TextEditingController(),
      confirmpasswordtex = TextEditingController(),
      usernametext = TextEditingController();

  // When opening the app this is much like initState or
  // oninit but it first ready the
  // things first or to load it.
  @override
  void onReady() {
    redirectCallback();
    super.onReady();
  }

  redirectCallback() {
    Firebaseconstant.firebaseAuth.authStateChanges().listen((user) {
      if (user != null) {
        // Get.offNamed(RouteString.mainhomePage!);
        log("User Not Null");
      } else {
        Get.offNamed(loginview!);
        log("User  Null");
      }
    });
  }

  //# Login
  loginUser() async {
    if (logintextController.text.isNotEmpty &&
        passwordtextController.text.isNotEmpty) {
      try {
        await Firebaseconstant.firebaseAuth
            .signInWithEmailAndPassword(
                email: logintextController.text,
                password: passwordtextController.text)
            .then((value) async {
          final response = await Firebaseconstant.getUserData(value.user!.uid);
          controllerRx.users(response);
          // final res = controllerRx.users(response);
        }).whenComplete(() => Get.snackbar("User Login", "User Login Success"));
      } on FirebaseAuthException catch (firebaseAuthException) {
        log(firebaseAuthException.message.toString());
      }
    } else {
      Get.snackbar("Empty Fields", "Require Email and Password");
    }
  }

  // # Sign up
  createUserdate() async {
    try {
      final result = await Firebaseconstant.firebaseAuth
          .createUserWithEmailAndPassword(
              email: logintextController.text,
              password: passwordtextController.text);
      await Firebaseconstant.addUserDetail(
          uid: result.user!.uid,
          email: logintextController.text,
          username: usernametext.text);
    } on FirebaseAuthException catch (firebaseAuthException) {
      log(firebaseAuthException.message.toString());
    }
  }
}
