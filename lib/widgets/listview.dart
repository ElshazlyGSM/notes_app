import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/notes/notes_cubit.dart';
import 'package:notes_app/model/notes_model.dart';
import 'custom_notes.dart';

class CustomBuildView extends StatelessWidget {
  const CustomBuildView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<NotesModel> notes = BlocProvider.of<NotesCubit>(context).notes!;
        return ListView.builder(
            padding: const EdgeInsets.all(0),
            itemCount: notes.length,
            itemBuilder: (context, index) {
              return  CustomNote(
                notes: notes[index],
              );
            });
  }
}
