import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes_app/constants.dart';
import '../../model/notes_model.dart';

part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitial());

  List<NotesModel>? notes;
  Color? color;

  getNotes() {
    emit(NotesSuccess1());
    var notesNox = Hive.box<NotesModel>(kNotesBox);
    notes = notesNox.values.toList();
    emit(NotesSuccess2());
    debugPrint(notes!.length.toString());
  }

  int n = 0;

  add() {
    n++;
    emit(NotesSuccess3());
  }
}
