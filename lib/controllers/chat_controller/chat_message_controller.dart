import 'dart:developer';

import 'package:chat/models/messages_model.dart';
import 'package:chat/models/own_chat_view_model.dart';
import 'package:chat/models/user_model.dart';
import 'package:chat/services/firebase_services_collection/firebase_collection_stream.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ChatMessageController extends GetxController {
  final idsOfChat = "".obs, nameuser = "".obs;
  final scrollToDown = false.obs;
  final Rx<ChatModelView> modelview = ChatModelView().obs;
  final List<MessageViewModel> message = <MessageViewModel>[].obs;
  final TextEditingController chattext = TextEditingController();
  final Rx<UserModel> userDetail = UserModel().obs;
  final ScrollController scroll = ScrollController();

  @override
  void onInit() {
    firstLoad();
    super.onInit();
  }

  firstLoad() {
    idsOfChat(Get.parameters['id']);
    nameuser(Get.parameters['name']);
    getTheListdata();
    getListMessage();
    getUserDetails();
    listentoNewMessage();
    update();
  }

  getUserDetails() async {
    final result = await Firebaseconstant.getUserData(
        idsOfChat.value.split("-").first.toString());
    userDetail(result);
    update();
  }

  getTheListdata() async {
    final result = await Firebaseconstant.getDetailChat(idsOfChat.value);
    modelview(result);
    update();
  }

  getListMessage() async {
    final result = await Firebaseconstant.getMessages(idsOfChat.value);
    message.assignAll(result);
    Future.delayed(
        1.seconds,
        () => scroll.animateTo(scroll.position.maxScrollExtent,
            duration: 600.milliseconds, curve: Curves.ease));
    update();
  }

  listentoNewMessage() {
    List<dynamic> list = [];

    CollectionFireStore.collectionChat
        .doc(idsOfChat.value)
        .collection("messages")
        .snapshots()
        .listen((event) {
      for (var newData in event.docs) {
        final Map<String, dynamic> obj = newData.data();

        list.add(obj);
        message
            .map((e) => list.removeWhere(
                (e1) => e1['timeStamp'].toString().contains(e.timeStamp!)))
            .toList();
      }

      List<MessageViewModel> messagex =
          list.map((e) => MessageViewModel.fromJson(e)).toList();
      message.addAll(messagex);

      update();
    });
  }

  sendMessage() async {
    try {
      await Firebaseconstant.sendMessage(
          userUid: userDetail.value.userUid!,
          message: chattext.text,
          images: [],
          chatRoomId: idsOfChat.value);
    } finally {
      scroll.animateTo(scroll.position.maxScrollExtent,
          duration: 600.milliseconds, curve: Curves.ease);
      chattext.clear();
    }
    update();
  }
}
