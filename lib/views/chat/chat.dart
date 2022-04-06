import 'package:chat/constants/colors.dart';
import 'package:chat/controllers/chat_controller.dart';
import 'package:chat/widget/buttons/button_ct.dart';
import 'package:chat/widget/profile_appbar/profile_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class ChatViews extends GetView<ChatController> {
  const ChatViews({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: decentWhite,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(
              left: 10,
              right: 10,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const ProfileAppbar(
                  imageNetwork: null,
                  color: null,
                  name: "Arte",
                  status: "online",
                ),

                // ButtonWithStyle(
                //   width: 50.w,
                //   height: 7.h,
                //   backColor: lightColor,
                //   label: "Add In",
                //   press: () => controller.addDummy(),
                //   textColor: backgroundColor,
                //   elevate: 1,
                //   colorSide: lightColor,
                // ),
              ],
            ),
          ),
        ));
  }
}
