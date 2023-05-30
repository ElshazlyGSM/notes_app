import 'package:flutter/material.dart';
import 'package:notes_app/screens/home_notes_screen.dart';
import 'package:notes_app/screens/notes_screen.dart';

void main() {
  runApp(const NotesApp());
}

class NotesApp extends StatelessWidget {
  const NotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute:  HomeNotesScreen.id,
      routes: {
        NotesScreen.id : (context ) => const NotesScreen(),
        HomeNotesScreen.id : (context ) => const HomeNotesScreen(),
      },
      theme: ThemeData(

        brightness: Brightness.dark
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
