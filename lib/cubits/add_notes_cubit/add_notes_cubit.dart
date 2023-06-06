import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/cubits/notes/notes_cubit.dart';
import 'package:notes_app/model/notes_model.dart';
part 'add_notes_state.dart';

class AddNotesCubit extends Cubit<AddNotesState> {
  AddNotesCubit() : super(AddNotesInitial());

  bool isLoading = false;


addNotes(NotesModel note,context) async {
  emit(AddNotesLoading());
  try {
    var notesNox = Hive.box<NotesModel>(kNotesBox);
     await notesNox.add(note);
    emit(AddNotesSuccess());
    BlocProvider.of<NotesCubit>(context).getNotes();
  } on Exception catch (e) {
    emit(AddNotesFailure(e.toString()));
    // TODO
  }
}
}
