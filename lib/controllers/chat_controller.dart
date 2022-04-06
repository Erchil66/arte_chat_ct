import 'dart:developer';

import 'package:chat/models/own_chat_view_model.dart';
import 'package:chat/services/firebase_services_collection/firebase_collection_stream.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class ChatController extends GetxController {
  @override
  void onReady() {
    // getOwnChats();
    super.onReady();
  }

  final FirebaseAuth auth = FirebaseAuth.instance;
  // final List<OwnChatModel> chatsList = <OwnChatModel>[].obs;
  // final List<Message> messageList = <Message>[].obs;

  getOwnChats() async {
    // final getown = await Firebaseconstant.getownChat(auth.currentUser!.uid);
    // if (getown.isNotEmpty) {
    //   chatsList.assignAll(getown);
    //   log(chatsList.toString());
    //   if (chatsList.isNotEmpty) {
    //     chatsList.map((e) => messageList.assignAll(e.messages!)).toList();
    //   }
    // } else {
    //   //
    // }
  }

  addDummy() {
    Firebaseconstant.addTouserChatDummy();
  }
}
