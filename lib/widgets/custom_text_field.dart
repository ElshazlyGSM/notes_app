import 'package:flutter/material.dart';
import 'package:notes_app/constants.dart';

class CustomFormTextField extends StatelessWidget {
  CustomFormTextField({this.hintText, this.onChanged,this.maxLines = 1, this.obscureText =false});
  Function(String)? onChanged;
  String? hintText;
  int? maxLines;
  bool? obscureText;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: kPrimerColor,
      maxLines: maxLines,
      obscureText:obscureText!,
      validator: (data) {
        if (data!.isEmpty) {
          return 'field is required';
        }
      },
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: hintText,

        hintStyle: const TextStyle(
          color: kPrimerColor,
        ),
        border: buildBorder(),
        enabledBorder: buildBorder(colorBorder: kPrimerColor),
        focusedBorder: buildBorder(colorBorder: kPrimerColor),
      ),
    );
  }

  OutlineInputBorder buildBorder({colorBorder}) {
    return  OutlineInputBorder(
        borderSide: BorderSide(
          color: colorBorder ?? Colors.white,
        ),
      );
  }
}
