import 'package:chat/constants/colors.dart';
import 'package:chat/constants/fonts.dart';
import 'package:chat/constants/jpeg_jpe_png.dart';
import 'package:chat/widget/text/text_with_style.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ProfileAppbar extends StatelessWidget {
  final String? imageNetwork;
  final String? name;
  final String? status;
  final Color? color;

  const ProfileAppbar(
      {Key? key, this.imageNetwork, this.name, this.status, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 5, bottom: 5),
      child: SizedBox(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 15.h,
              width: 15.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                    color: color != null ? color! : darkishColor!, width: 2),
              ),
              child: imageNetwork == null
                  ? Image.asset(
                      logoOriginal,
                      fit: BoxFit.contain,
                    )
                  : Image.network(
                      imageNetwork!,
                      fit: BoxFit.cover,
                    ),
            ),
            SizedBox(
              width: 2.w,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                textDirection: TextDirection.ltr,
                children: [
                  TextWithStyle(
                    label: name!,
                    textColor: black,
                    fontFamiliy: metroSemibold,
                    textSize: 12.sp,
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  TextWithStyle(
                    label: status!,
                    textColor: lightColor,
                    fontFamiliy: metroSemibold,
                    textSize: 9.sp,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
