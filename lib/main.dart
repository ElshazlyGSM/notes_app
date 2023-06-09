import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/cubits/bloc_observer.dart';
import 'package:notes_app/cubits/notes/notes_cubit.dart';
import 'package:notes_app/model/notes_model.dart';
import 'package:notes_app/screens/home_notes_screen.dart';
import 'package:notes_app/screens/edit_notes_screen.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  Bloc.observer = MyBlocObserver();
  await Hive.initFlutter();
  Hive.registerAdapter(NotesModelAdapter());
  await Hive.openBox<NotesModel>(kNotesBox);

  runApp(const NotesApp());
}

class NotesApp extends StatelessWidget {
  const NotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NotesCubit(),
      child: MaterialApp(
        initialRoute: HomeNotesScreen.id,
        routes: {
          EditNotesScreen.id: (context) => const EditNotesScreen(),
          HomeNotesScreen.id: (context) => const HomeNotesScreen(),
        },
        theme: ThemeData(brightness: Brightness.dark),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
