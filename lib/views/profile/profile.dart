import 'package:chat/constants/colors.dart';
import 'package:chat/constants/fonts.dart';
import 'package:chat/constants/jpeg_jpe_png.dart';
import 'package:chat/controllers/profile_controller.dart';
import 'package:chat/widget/profile_widgets/profile_button.dart';
import 'package:chat/widget/text/text_with_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';
import 'package:sizer/sizer.dart';

class ProfileViews extends GetView<ProfileController> {
  const ProfileViews({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor: decentWhite,
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
          child: SingleChildScrollView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            physics: const BouncingScrollPhysics(),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Center(
                  child: Container(
                    height: 25.h,
                    width: 35.w,
                    decoration: BoxDecoration(
                      color: opacityBlueish!,
                      shape: BoxShape.circle,
                    ),
                    child: Image.asset(logoOriginal),
                  ),
                ),
                TextWithStyle(
                  label: controller.controllerRx.users.value.username ?? "",
                  textSize: 12.sp,
                  fontFamiliy: metroBold,
                  textColor: black,
                ),
                SizedBox(
                  height: 1.2.h,
                ),
                TextWithStyle(
                  label: controller.controllerRx.users.value.email ?? "",
                  textSize: 9.sp,
                  fontFamiliy: metroRegular,
                  textColor: black!.withOpacity(0.5),
                ),
                SizedBox(
                  height: 10.h,
                ),
                ProfileWidgetButton(
                  press: () {},
                  label: "Update Information",
                  icons: LineIcon(LineIcons.infoCircle),
                  showDivider: true,
                ),
                SizedBox(
                  height: 3.h,
                ),
                ProfileWidgetButton(
                  press: () {},
                  label: "Settings",
                  icons: LineIcon(LineIcons.cog),
                  showDivider: true,
                ),
                SizedBox(
                  height: 3.h,
                ),
                ProfileWidgetButton(
                  press: () {},
                  label: "Prefferences",
                  icons: LineIcon(LineIcons.handHoldingHeart),
                  showDivider: true,
                ),
                SizedBox(
                  height: 3.h,
                ),
                ProfileWidgetButton(
                  press: () => controller.controllerRx.signOutUser(),
                  label: "Log-out",
                  icons: LineIcon(LineIcons.alternateSignOut),
                  showDivider: false,
                ),
              ],
            ),
          ),
        )),
      ),
    );
  }
}
