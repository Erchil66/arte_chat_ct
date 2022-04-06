import 'dart:developer';

import 'package:chat/controllers/controller_user_model.dart';
import 'package:chat/models/own_chat_view_model.dart';
import 'package:chat/services/firebase_services_collection/firebase_collection_stream.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late TabController tabController;
  final TextEditingController search = TextEditingController();
  final controlRx = Get.find<ControlleruserRx>();

  @override
  void onInit() {
    getUserDetails();
    super.onInit();
    tabController = TabController(length: 2, vsync: this);
    super.onInit();
  }

  final FirebaseAuth auth = FirebaseAuth.instance;

  getUserDetails() async {
    final result = await Firebaseconstant.getUserData(auth.currentUser!.uid);
    controlRx.users(result);
  }

  getOwnChats() async {}
}
