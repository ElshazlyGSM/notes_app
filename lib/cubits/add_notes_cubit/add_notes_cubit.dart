import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/model/notes_model.dart';
part 'add_notes_state.dart';

class AddNotesCubit extends Cubit<AddNotesState> {
  AddNotesCubit() : super(AddNotesInitial());

addNotes(NotesModel note) async {
  emit(AddNotesLoading());
  try {
    var notesNox = Hive.box(kNotesBox);
    emit(AddNotesSuccess());
     await notesNox.add(note);
  } on Exception catch (e) {
    emit(AddNotesFailure(e.toString()));
    // TODO
  }
}
}
