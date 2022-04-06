import 'package:chat/constants/colors.dart';
import 'package:chat/constants/fonts.dart';
import 'package:chat/constants/jpeg_jpe_png.dart';
import 'package:chat/controllers/login_signup_controller.dart';
import 'package:chat/routes/route_strings.dart';
import 'package:chat/widget/buttons/button_ct.dart';
import 'package:chat/widget/text/text_span_log.dart';
import 'package:chat/widget/text/text_with_style.dart';
import 'package:chat/widget/textfields/textfields_logs.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class LoginSignupView extends StatelessWidget {
  const LoginSignupView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginSignUpController());
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 10.h,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Center(
                  child: Image.asset(
                    inlogoSplash,
                    width: 60.w,
                  ),
                ),
              ),
              SizedBox(
                height: 4.h,
              ),
              TextWithStyle(
                label: "Chat, Post, and Enjoy!",
                textColor: black,
                textSize: 11.sp,
                fontFamiliy: metroSemibold,
              ),
              SizedBox(
                height: 5.h,
              ),
              TextFieldCustom(
                controller: controller.logintextController,
                hintText: "Email",
                validator: (val) {},
                onsave: (val) {},
                inputType: TextInputType.text,
                obsecure: false,
                onchanged: (val) {},
                capitalization: TextCapitalization.sentences,
              ),
              SizedBox(
                height: 4.h,
              ),
              TextFieldCustom(
                controller: controller.passwordtextController,
                hintText: "Password",
                validator: (val) {},
                onsave: (val) {},
                inputType: TextInputType.text,
                obsecure: true,
                onchanged: (val) {},
                capitalization: TextCapitalization.sentences,
              ),
              SizedBox(
                height: 8.h,
              ),
              ButtonWithStyle(
                width: 50.w,
                height: 7.h,
                backColor: lightColor,
                label: "Sign In",
                press: () => controller.loginUser(),
                textColor: backgroundColor,
                elevate: 1,
                colorSide: lightColor,
              ),
              SizedBox(
                height: 8.h,
              ),
              TextSpanLoggesture(
                ontap: TapGestureRecognizer()
                  ..onTap = () => Get.offNamed(signupview!),
                messageStarter: "Don't have Account Yet? ",
                messageMid: "Sign Up Now.",
                messageEnd: "And Enjoy our app.",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
