import 'package:flutter/material.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/model/notes_model.dart';
import 'package:notes_app/screens/home_notes_screen.dart';
import 'package:notes_app/screens/notes_screen.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox(kNotesBox);
  Hive.registerAdapter(NotesModelAdapter());
  runApp(const NotesApp());
}

class NotesApp extends StatelessWidget {
  const NotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: HomeNotesScreen.id,
      routes: {
        NotesScreen.id: (context) => const NotesScreen(),
        HomeNotesScreen.id: (context) => const HomeNotesScreen(),
      },
      theme: ThemeData(brightness: Brightness.dark),
      debugShowCheckedModeBanner: false,
    );
  }
}
