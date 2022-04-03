import 'package:chat/constants/fonts.dart';
import 'package:chat/widget/text/text_with_style.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ButtonWithStyle extends StatelessWidget {
  final double? width;
  final double? height;
  final Color? backColor;
  final String? label;
  final Function()? press;
  final Color? textColor;
  final double? elevate;
  final Color? colorSide;

  const ButtonWithStyle(
      {Key? key,
      this.width,
      this.height,
      this.backColor,
      this.label,
      this.press,
      this.textColor,
      this.elevate,
      this.colorSide})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height!,
      width: width!,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            elevation: elevate ?? 0,
            primary: backColor,
            shape: RoundedRectangleBorder(
                side: BorderSide(color: colorSide ?? Colors.transparent),
                borderRadius: BorderRadius.circular(8))),
        child: Center(
          child: TextWithStyle(
            textColor: textColor ?? backColor!,
            label: label,
            textSize: 12.sp,
            alignment: TextAlign.center,
            fontFamiliy: metroRegular!,
          ),
        ),
        onPressed: press,
      ),
    );
  }
}
