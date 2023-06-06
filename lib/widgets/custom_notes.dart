import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/notes/notes_cubit.dart';
import 'package:notes_app/model/notes_model.dart';
import 'package:notes_app/screens/edit_notes_screen.dart';
import 'package:intl/intl.dart';

class CustomNote extends StatelessWidget {
  const CustomNote({Key? key, required this.notes}) : super(key: key);
  final NotesModel notes;

  @override
  Widget build(BuildContext context) {
    DateTime date = DateTime.parse(notes.date);
    String formattedDate = DateFormat.yMMMMd().format(date);
        return GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, EditNotesScreen.id,arguments: notes);
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: double.infinity,
              height: 130,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color(notes.color),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      title: Text(
                        notes.title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            fontSize: 25, fontWeight: FontWeight.w500),
                      ),
                      subtitle: Padding(
                        padding: const EdgeInsets.only(top: 2),
                        child: Text(
                          notes.subTitle,
                          maxLines: 2,
                          overflow: TextOverflow.fade,
                          style: const TextStyle(fontSize: 17),
                        ),
                      ),
                      trailing: IconButton(
                        onPressed: () {
                          notes.delete();
                          BlocProvider.of<NotesCubit>(context).getNotes();
                        },
                        icon: const Icon(
                          Icons.delete_forever,
                          size: 26,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10,right: 20),
                    child: Text(
                      formattedDate,
                      style: const TextStyle(fontSize: 20),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
  }
}
