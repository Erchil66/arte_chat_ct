import 'package:chat/routes/route_strings.dart';
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
      name: loginview!,
      page: () => const LoginSignupView(),
    ),
    // Signup
    GetPage(
      transition: Transition.downToUp,
      transitionDuration: 350.milliseconds,
      curve: Curves.ease,
      name: signupview!,
      page: () => const SignupView(),
    ),
  ];
}
