import 'package:chat/constants/colors.dart';
import 'package:chat/constants/fonts.dart';
import 'package:chat/widget/text/text_with_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';
import 'package:sizer/sizer.dart';

class AppbarForall extends StatelessWidget {
  final Function()? viewProfile;
  final String? namelabel;

  const AppbarForall({Key? key, this.viewProfile, this.namelabel})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () => Get.back(),
            behavior: HitTestBehavior.deferToChild,
            child: Container(
              height: 12.h,
              width: 12.w,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                //color: opacityBlueish,
              ),
              child: LineIcon(LineIcons.arrowLeft),
            ),
          ),
          Expanded(
            child: Center(
              child: TextWithStyle(
                label: namelabel ?? "",
                textColor: black,
                textSize: 16.sp,
                fontFamiliy: metroBold,
              ),
            ),
          ),
          GestureDetector(
            onTap: viewProfile,
            behavior: HitTestBehavior.deferToChild,
            child: Container(
              height: 12.h,
              width: 12.w,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: decentWhite,
              ),
              child: LineIcon(LineIcons.crow),
            ),
          ),
        ],
      ),
    );
  }
}
