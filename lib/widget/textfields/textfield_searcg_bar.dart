import 'package:chat/constants/colors.dart';
import 'package:chat/constants/fonts.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class TextSearchBar extends StatelessWidget {
  final TextEditingController? textEditingController;
  final String? label;
  final bool? showBorder;
  final void Function(String)? onchanged;
  final void Function(String)? onSubmit;

  const TextSearchBar(
      {Key? key,
      this.textEditingController,
      this.label,
      this.showBorder,
      this.onchanged,
      this.onSubmit})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15),
      child: SizedBox(
        height: 48,
        child: TextFormField(
          //expands: true,
          onFieldSubmitted: onSubmit,
          controller: textEditingController,
          autofocus: false,
          textCapitalization: TextCapitalization.none,
          textAlign: TextAlign.left,
          cursorColor: black!,
          style: TextStyle(fontFamily: metroRegular!, fontSize: 11.sp),
          keyboardType: TextInputType.text,
          onChanged: onchanged,
          decoration: InputDecoration(
            suffixIcon: IconButton(
                onPressed: textEditingController!.clear,
                icon: const Icon(Icons.clear)),
            labelText: label ?? "Search",
            floatingLabelStyle:
                const TextStyle(color: black, fontFamily: metroRegular),
            focusedBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(5)),
              borderSide: BorderSide(color: darkishColor!),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(5)),
              borderSide: BorderSide(color: opacityBlueish!),
            ),
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ),
    );
  }
}
