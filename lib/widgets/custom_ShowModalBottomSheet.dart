import 'package:flutter/material.dart';
import 'package:notes_app/widgets/custom_Button.dart';
import 'package:notes_app/widgets/custom_text_field.dart';

void customShowModalBottomSheet(BuildContext context) {
  showModalBottomSheet(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      context: context, builder: (context){
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: SingleChildScrollView(
        child: Column(children: [
          CustomFormTextField(hintText: 'title',),
          const SizedBox(height: 10,),
          CustomFormTextField(maxLines: 5,hintText: 'subject'),
          const SizedBox(height: 30,),
          CustomButon(text: 'Add',),
        ],),
      ),
    );
  });
}