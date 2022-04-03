import 'package:chat/constants/colors.dart';
import 'package:chat/constants/fonts.dart';
import 'package:flutter/material.dart';

class TextWithStyle extends StatelessWidget {
  final String? label;
  final Color? textColor;
  final double? textSize;
  final String? fontFamiliy;
  final TextAlign? alignment;
  final TextOverflow? overflow;

  const TextWithStyle(
      {Key? key,
      this.label,
      this.textColor,
      this.textSize,
      this.fontFamiliy,
      this.alignment,
      this.overflow})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Text(
        label!,
        textAlign: alignment ?? TextAlign.left,
        overflow: overflow ?? TextOverflow.clip,
        style: TextStyle(
            fontSize: textSize ?? 12,
            color: textColor ?? backgroundColor,
            fontFamily: fontFamiliy ?? metroRegular!),
      );
}
