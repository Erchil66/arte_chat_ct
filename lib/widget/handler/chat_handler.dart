import 'package:chat/constants/colors.dart';
import 'package:chat/models/user_model.dart';
import 'package:chat/widget/text/text_with_style.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ChathandlerView extends StatelessWidget {
  final String? label;
  final Function()? press;

  const ChathandlerView({Key? key, this.label, this.press}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5, bottom: 5),
      child: GestureDetector(
        onTap: press,
        behavior: HitTestBehavior.deferToChild,
        child: Container(
          height: 10.h,
          decoration: BoxDecoration(
              color: opacityBlueish, borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextWithStyle(
                  label: label ?? "",
                  textColor: black,
                  textSize: 18.sp,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
