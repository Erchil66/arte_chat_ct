import 'package:flutter/material.dart';

class LoginSignupView extends StatelessWidget {
  const LoginSignupView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: Column(
            children: [],
          ),
        ),
      ),
    );
  }
}
