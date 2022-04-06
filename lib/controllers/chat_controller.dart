import 'dart:developer';

import 'package:chat/controllers/controller_user_model.dart';
import 'package:chat/models/own_chat_view_model.dart';
import 'package:chat/models/user_model.dart';
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
  final List<ChatModelView> chatmodel = <ChatModelView>[].obs;

  @override
  void onInit() {
    getUserDetails();
    getOwnChats();
    super.onInit();
    tabController = TabController(length: 2, vsync: this);
    super.onInit();
  }

  final FirebaseAuth auth = FirebaseAuth.instance;

  getUserDetails() async {
    final result = await Firebaseconstant.getUserData(auth.currentUser!.uid);
    controlRx.users(result);
    update();
  }

  getOwnChats() async {
    final result = await Firebaseconstant.getownChat(auth.currentUser!.uid);
    chatmodel.assignAll(result);
    update();
  }

  getnameFromIt(String? uids) async {
    final string = "".obs;
    final splitIt = uids!.split(",").toList();
    final whereNotMyId = splitIt
        .where((e) => e != Firebaseconstant.firebaseAuth.currentUser!.uid);
    final result =
        await Firebaseconstant.getSingleName(whereNotMyId.first.toString());
    string(await result);
    return string.value;
  }

  Future<UserModel> getModel(String? uids) async {
    final splitIt = uids!.split(",").toList();
    final whereNotMyId = splitIt
        .where((e) => e != Firebaseconstant.firebaseAuth.currentUser!.uid);
    final result =
        await Firebaseconstant.getUserData(whereNotMyId.first.toString());
    return result;
  }
}
