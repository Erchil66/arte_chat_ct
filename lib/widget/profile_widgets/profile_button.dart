import 'package:chat/constants/colors.dart';
import 'package:chat/constants/fonts.dart';
import 'package:chat/widget/text/text_with_style.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';
import 'package:sizer/sizer.dart';

class ProfileWidgetButton extends StatelessWidget {
  final Function()? press;
  final String? label;
  final Widget? icons;
  final bool? showDivider;

  const ProfileWidgetButton(
      {Key? key, this.press, this.label, this.icons, this.showDivider})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      behavior: HitTestBehavior.deferToChild,
      child: SizedBox(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              child: Row(
                children: [
                  SizedBox(
                    height: 3.h,
                    width: 3.w,
                    child: icons,
                  ),
                  SizedBox(
                    width: 6.w,
                  ),
                  Expanded(
                    child: TextWithStyle(
                      label: label ?? "",
                      textSize: 12.sp,
                      fontFamiliy: metroSemibold,
                      textColor: black,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 1.h,
            ),
            Visibility(
              visible: showDivider ?? false,
              child: Divider(
                color: black!.withOpacity(0.2),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
