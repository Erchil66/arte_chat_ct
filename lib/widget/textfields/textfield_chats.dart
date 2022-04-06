import 'package:chat/constants/colors.dart';
import 'package:chat/constants/fonts.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class TextFieldForChatuse extends StatelessWidget {
  final String? hintText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final TextInputType? inputType;
  final bool? obsecure;
  final void Function(String?)? onchanged;
  final void Function(String?)? onsave;
  final TextCapitalization? capitalization;

  const TextFieldForChatuse(
      {Key? key,
      this.hintText,
      this.controller,
      this.validator,
      this.inputType,
      this.obsecure,
      this.onchanged,
      this.onsave,
      this.capitalization})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TextFormField(
        autocorrect: false,
        autofocus: false,
        controller: controller!,
        keyboardType: inputType ?? TextInputType.text,
        obscureText: obsecure ?? false,
        onChanged: onchanged!,
        onSaved: onsave!,
        maxLines: inputType == TextInputType.multiline ? null : null,
        validator: validator!,
        textCapitalization: capitalization ?? TextCapitalization.none,
        textAlign: TextAlign.center,
        cursorColor: black!,
        decoration: InputDecoration(
          border: const UnderlineInputBorder(
              // borderSide: BorderSide(color: opacityBlueish!),
              borderSide: BorderSide.none),
          focusedBorder: const UnderlineInputBorder(
              // borderSide: BorderSide(color: opacityBlueish!),
              borderSide: BorderSide.none),
          // enabledBorder: UnderlineInputBorder(
          //   borderSide: BorderSide(color: opacityBlueish!),
          // ),
          fillColor: decentWhite,
          filled: true,
          hintText: hintText!,
          hintStyle: TextStyle(
              fontSize: 11.sp, fontFamily: metroRegular!, color: black),
        ),
      ),
    );
  }
}
