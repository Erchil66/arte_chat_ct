import 'package:chat/constants/colors.dart';
import 'package:chat/controllers/main_home_controller.dart';
import 'package:chat/views/chat/chat.dart';
import 'package:chat/views/group/group.dart';
import 'package:chat/views/post/post.dart';
import 'package:chat/views/profile/profile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';

class MainHomePage extends StatelessWidget {
  const MainHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MainHomeController());

    return WillPopScope(
      onWillPop: () async => false,
      // Add OBX
      child: Obx(
        () => Scaffold(
          backgroundColor: backgroundColor,
          body: SafeArea(
            child: SingleChildScrollView(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              //Index Files
              child: IndexedStack(
                // Selected Number
                index: controller.selectedIndex.value,
                children: const [
                  // Our Pages
                  ChatViews(),
                  PostViews(),
                  GroupViews(),
                  ProfileViews(),
                ],
              ),
              //End
            ),
          ),
          bottomNavigationBar: GNav(
            //add tabs
            selectedIndex: controller.selectedIndex.value,
            //
            tabBorderRadius: 15,
            haptic: true,
            curve: Curves.easeOutExpo,
            duration: const Duration(milliseconds: 900),
            gap: 8,
            activeColor: lightColor,
            tabBackgroundColor: lightColor!.withOpacity(0.4),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            tabs: const [
              GButton(
                icon: LineIcons.home,
                text: "Home",
              ),
              GButton(
                icon: LineIcons.podcast,
                text: "Post",
              ),
              GButton(
                icon: LineIcons.layerGroup,
                text: "Group",
              ),
              GButton(
                icon: LineIcons.crow,
                text: "Profile",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
