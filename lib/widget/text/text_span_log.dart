import 'package:chat/constants/colors.dart';
import 'package:chat/constants/fonts.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class TextSpanLoggesture extends StatelessWidget {
  final GestureRecognizer? ontap;
  final String? messageStarter;
  final String? messageMid;
  final String? messageEnd;

  const TextSpanLoggesture(
      {Key? key,
      this.ontap,
      this.messageStarter,
      this.messageMid,
      this.messageEnd})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: RichText(
        text: TextSpan(children: [
          TextSpan(
            text: messageStarter,
            style: TextStyle(
                fontSize: 11, color: black!, fontFamily: metroRegular!),
          ),
          TextSpan(
            text: messageMid,
            recognizer: ontap,
            style: TextStyle(
                fontSize: 11, color: lightColor!, fontFamily: metroRegular!),
          ),
          TextSpan(
            text: messageEnd,
            style: TextStyle(
                fontSize: 11, color: black!, fontFamily: metroRegular!),
          ),
        ]),
      ),
    );
  }
}
