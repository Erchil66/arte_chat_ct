import 'dart:async';
import 'dart:developer';

import 'package:chat/constants/colors.dart';
import 'package:chat/constants/fonts.dart';
import 'package:chat/controllers/chat_controller.dart';
import 'package:chat/models/own_chat_view_model.dart';
import 'package:chat/models/user_model.dart';
import 'package:chat/routes/route_strings.dart';
import 'package:chat/widget/buttons/button_ct.dart';
import 'package:chat/widget/handler/chat_handler.dart';
import 'package:chat/widget/profile_appbar/profile_bar.dart';
import 'package:chat/widget/textfields/textfield_searcg_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class ChatViews extends GetView<ChatController> {
  const ChatViews({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChatController>(
        init: ChatController(),
        builder: (controller) {
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
                      ProfileAppbar(
                        imageNetwork: null,
                        color: null,
                        name: controller.controlRx.users.value.username ?? "",
                        // name: controller.auth.currentUser!.email,
                        // name: controller.controlRx.users.value.details != null
                        //     ? controller.controlRx.users.value.username
                        //     : controller.controlRx.users.value.details!
                        //                 .firstname!.isEmpty &&
                        //             controller.controlRx.users.value.details!
                        //                 .lastname!.isEmpty
                        //         ? controller.controlRx.users.value.username
                        //         : controller.controlRx.users.value.details!
                        //                     .firstname!.isNotEmpty &&
                        //                 controller.controlRx.users.value
                        //                     .details!.lastname!.isNotEmpty
                        //             ? "${controller.controlRx.users.value.details!.firstname} ${controller.controlRx.users.value.details!.lastname}"
                        //             : controller.auth.currentUser!.email,
                        status: "online",
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      TextSearchBar(
                        textEditingController: controller.search,
                        onSubmit: (val) {},
                        onchanged: (val) {
                          if (val.isEmpty) {
                            FocusScope.of(context).unfocus();
                          }
                        },
                        showBorder: true,
                      ),
                      SizedBox(
                        height: 3.h,
                      ),
                      // DefaultTabController(
                      //   length: 2,
                      //   child: TabBar(
                      //     controller: controller.tabController,
                      //     indicatorColor: lightColor!,
                      //     labelColor: black,
                      //     labelStyle: TextStyle(
                      //       fontFamily: metroRegular,
                      //       fontSize: 9.sp,
                      //       color: black,
                      //     ),
                      //     tabs: const [
                      //       Tab(
                      //         text: "Chats",
                      //       ),
                      //       Tab(
                      //         text: "Groups",
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      // SizedBox(
                      //   height: 1.h,
                      // ),
                      // Expanded(
                      //   child: TabBarView(
                      //     controller: controller.tabController,
                      //     children: [
                      //       controller.chatmodel.isEmpty
                      //           ? const SizedBox.shrink()
                      //           : ListView.builder(
                      //               itemCount: controller.chatmodel.length,
                      //               shrinkWrap: true,
                      //               keyboardDismissBehavior:
                      //                   ScrollViewKeyboardDismissBehavior
                      //                       .onDrag,
                      //               itemBuilder: (context, index) =>
                      //                   FutureBuilder(
                      //                       future: controller.getModel(
                      //                           controller.chatmodel[index]
                      //                               .participants),
                      //                       builder: (context,
                      //                           AsyncSnapshot<UserModel>
                      //                               async) {
                      //                         if (async.hasData) {
                      //                           return ChathandlerView(
                      //                             press: () async =>
                      //                                 Get.toNamed(chat_logs!,
                      //                                     parameters: {
                      //                                   "id": controller
                      //                                       .chatmodel[index]
                      //                                       .participants!
                      //                                       .replaceAll(
                      //                                           ",", "-"),
                      //                                   "name": async
                      //                                       .data!.username
                      //                                       .toString()
                      //                                 }),
                      //                             label: async.data!.username,
                      //                           );
                      //                         } else {
                      //                           return const SizedBox.shrink();
                      //                         }
                      //                       }),
                      //             ),
                      //       Container(
                      //         height: MediaQuery.of(context).size.height,
                      //         // color: opacityBlueish,
                      //       ),
                      //     ],
                      //   ),
                      // ),

                      //Here
                      // ButtonWithStyle(
                      //   width: 50.w,
                      //   height: 7.h,
                      //   backColor: lightColor,
                      //   label: "Get In",
                      //   press: () => controller.getOwnChats(),
                      //   textColor: backgroundColor,
                      //   elevate: 1,
                      //   colorSide: lightColor,
                      // ),
                    ],
                  ),
                ),
              ));
        });
  }
}
