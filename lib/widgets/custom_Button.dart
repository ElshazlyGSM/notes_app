import 'package:flutter/material.dart';
import 'package:notes_app/constants.dart';

class CustomButon extends StatelessWidget {
  CustomButon({ this.onTap ,required this.text}) ;
  VoidCallback? onTap;
  String text;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ,
      child: Container(
        decoration: BoxDecoration(
          color: kPrimerColor.withOpacity(.8),
          borderRadius: BorderRadius.circular(8),
        ),
        width: MediaQuery.of(context).size.width,
        height: 60,
        child: Center(
          child: Text(text,style: const TextStyle(fontWeight: FontWeight.w600,fontSize: 18),),
        ),
      ),
    );
  }
}
