import 'package:chat/constants/colors.dart';
import 'package:chat/constants/fonts.dart';
import 'package:chat/widget/text/text_with_style.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ChatCard extends StatelessWidget {
  final List<String>? images;
  final String? message;
  final String? uid;
  final String? from;
  final String? data;

  const ChatCard(
      {Key? key, this.images, this.message, this.uid, this.from, this.data})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 5,
        bottom: 5,
      ),
      child: SizedBox(
        child: Column(
          crossAxisAlignment: from!.contains(uid!)
              ? CrossAxisAlignment.end
              : CrossAxisAlignment.start,
          mainAxisAlignment: from!.contains(uid!)
              ? MainAxisAlignment.end
              : MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: from!.contains(uid!)
                  ? const EdgeInsets.only(left: 20)
                  : const EdgeInsets.only(right: 20),
              child: Container(
                decoration: BoxDecoration(
                  color: decentWhite,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: TextWithStyle(
                    label: message ?? "",
                    textColor: black,
                    textSize: 11.sp,
                    fontFamiliy: metroRegular,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 1.2.h,
            ),
            SizedBox(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: from!.contains(uid!)
                    ? MainAxisAlignment.end
                    : MainAxisAlignment.start,
                children: [
                  TextWithStyle(
                    label: data ?? "",
                    textColor: black,
                    textSize: 8.sp,
                    fontFamiliy: metroRegular,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
