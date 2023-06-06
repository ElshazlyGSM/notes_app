import 'package:flutter/material.dart';
import 'package:notes_app/model/notes_model.dart';
import 'package:notes_app/widgets/custom_appbar.dart';
import 'package:notes_app/widgets/custom_text_field.dart';

class EditNotesScreen extends StatelessWidget {
  const EditNotesScreen({Key? key}) : super(key: key);
  static String id = 'notesScreen';

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as NotesModel;
    String? title, subTitle;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(
              height: 25,
            ),
            CustomAppbar(
              icon: Icons.check,
              text: 'Edit',
              onPressed: () {
                args.title = title ?? args.title;
                args.subTitle = subTitle ?? args.subTitle;
                args.save();
                Navigator.pop(context);
              },
            ),
            const SizedBox(
              height: 30,
            ),
            CustomFormTextField(
              hintText: 'title',
              onChanged: (value) {
                title = value;
              },
            ),
            const SizedBox(
              height: 10,
            ),
            CustomFormTextField(
              maxLines: 5,
              hintText: 'subject',
              onChanged: (value) {
                subTitle = value;
              },
            ),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
