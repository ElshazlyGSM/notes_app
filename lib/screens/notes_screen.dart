import 'package:flutter/material.dart';
import 'package:notes_app/widgets/custom_appbar.dart';
import 'package:notes_app/widgets/custom_text_field.dart';

class NotesScreen extends StatelessWidget {
  const NotesScreen({Key? key}) : super(key: key);
  static String id = 'notesScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: const [
            SizedBox(
              height: 25,
            ),
            CustomAppbar(icon: Icons.check,text: 'Edit'),
            SizedBox(height: 30,),
            CustomFormTextField(hintText: 'title',),
            SizedBox(height: 10,),
            CustomFormTextField(maxLines: 5,hintText: 'subject'),
            SizedBox(height: 30,),
          ],
        ),
      ),
    );
  }
}
