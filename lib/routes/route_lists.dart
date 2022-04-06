import 'package:chat/binding/binding_chat_controller.dart';
import 'package:chat/binding/binding_main_home.dart';
import 'package:chat/binding/binding_user.dart';
import 'package:chat/routes/route_strings.dart';
import 'package:chat/views/chat/chat.dart';
import 'package:chat/views/home_view/main_home.dart';
import 'package:chat/views/login_signup/login_signup.dart';
import 'package:chat/views/login_signup/sign_up.dart';
import 'package:flutter/animation.dart';
import 'package:get/get.dart';

class RouteLists {
  static final lists = [
    //Login
    GetPage(
      transition: Transition.downToUp,
      transitionDuration: 350.milliseconds,
      curve: Curves.ease,
      binding: BindUser(),
      name: loginview!,
      page: () => const LoginSignupView(),
    ),
    // Signup
    GetPage(
      transition: Transition.downToUp,
      transitionDuration: 350.milliseconds,
      curve: Curves.ease,
      binding: BindUser(),
      name: signupview!,
      page: () => const SignupView(),
    ),
    // Home Main
    GetPage(
      transition: Transition.downToUp,
      transitionDuration: 350.milliseconds,
      curve: Curves.ease,
      // From Here
      binding: BindingMainHome(),
      // Put Always Exclamatory !
      name: mainHome!,
      page: () => const MainHomePage(),
    ),
    // Pages from BottomNav
    GetPage(
      transition: Transition.downToUp,
      transitionDuration: 350.milliseconds,
      curve: Curves.ease,
      // From Here
      binding: BindingChat(),
      // Put Always Exclamatory !
      name: mainHome!,
      page: () => const ChatViews(),
    ),
  ];
}
