import 'package:flutter/material.dart';
import 'package:notes_app/constants.dart';

class CustomFormTextField extends StatelessWidget {
  const CustomFormTextField({
    this.hintText,
    this.onChanged,
    this.onSaved,
    this.maxLines = 1,
    this.obscureText = false,
  });

  final Function(String)? onChanged;
  final  void Function(String?)?  onSaved;
  final String? hintText;
  final int? maxLines;
  final bool? obscureText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: onSaved,
      cursorColor: kPrimerColor,
      maxLines: maxLines,
      obscureText: obscureText!,
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
        enabledBorder: buildBorder(),
        focusedBorder: buildBorder(colorBorder: kPrimerColor),
      ),
    );
  }

  OutlineInputBorder buildBorder({colorBorder}) {
    return OutlineInputBorder(
      borderSide: BorderSide(
        color: colorBorder ?? Colors.white,
      ),
    );
  }
}
