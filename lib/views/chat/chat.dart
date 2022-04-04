import 'package:chat/constants/colors.dart';
import 'package:chat/controllers/chat_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatViews extends GetView<ChatController> {
  const ChatViews({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      color: lightColor,
    );
  }
}
