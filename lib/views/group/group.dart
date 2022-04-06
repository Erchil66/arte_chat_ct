import 'package:chat/constants/colors.dart';
import 'package:chat/constants/fonts.dart';
import 'package:chat/controllers/group_controller.dart';
import 'package:chat/widget/buttons/button_ct.dart';
import 'package:chat/widget/text/text_with_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class GroupViews extends GetView<GroupController> {
  const GroupViews({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GroupController>(
        init: GroupController(),
        builder: (controller) {
          return Scaffold(
            backgroundColor: decentWhite,
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(top: 10, right: 15, left: 15),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: controller.userlist.length,
                      itemBuilder: (context, index) => SizedBox(
                        height: 20.h,
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          children: [
                            TextWithStyle(
                              label: controller.userlist[index].username!,
                              textSize: 18.sp,
                              textColor: black,
                              fontFamiliy: metroSemibold,
                            ),
                            SizedBox(
                              height: 1.h,
                            ),
                            ButtonWithStyle(
                              width: 50.w,
                              height: 4.h,
                              backColor: lightColor,
                              label: "Add Me",
                              press: () => controller.actionToAdd(
                                  usernamex:
                                      controller.userlist[index].username!,
                                  uiduser: controller.userlist[index].userUid!,
                                  fistnamex: "",
                                  lastnamex: ""),
                              textColor: backgroundColor,
                              elevate: 1,
                              colorSide: lightColor,
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}
