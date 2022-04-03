import 'package:chat/constants/colors.dart';
import 'package:chat/constants/fonts.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class TextFieldCustom extends StatelessWidget {
  final String? hintText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final TextInputType? inputType;
  final bool? obsecure;
  final void Function(String?)? onchanged;
  final void Function(String?)? onsave;
  final TextCapitalization? capitalization;

  const TextFieldCustom(
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
      width: 296,
      child: TextFormField(
        autocorrect: false,
        autofocus: false,
        controller: controller!,
        keyboardType: inputType ?? TextInputType.text,
        obscureText: obsecure ?? false,
        onChanged: onchanged!,
        onSaved: onsave!,
        validator: validator!,
        textCapitalization: capitalization ?? TextCapitalization.none,
        textAlign: TextAlign.center,
        cursorColor: black!,
        decoration: InputDecoration(
          border: UnderlineInputBorder(
            borderSide: BorderSide(color: opacityBlueish!),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: opacityBlueish!),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: opacityBlueish!),
          ),
          fillColor: backgroundColor,
          filled: true,
          hintText: hintText!,
          hintStyle: TextStyle(
              fontSize: 11.sp, fontFamily: metroRegular!, color: black),
        ),
      ),
    );
  }
}
