import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/notes/notes_cubit.dart';
import 'package:notes_app/widgets/body.dart';
import 'package:notes_app/widgets/custom_floatingActionButton.dart';

class HomeNotesScreen extends StatefulWidget {
  const HomeNotesScreen({Key? key}) : super(key: key);
  static String id = 'homeNotesScreen';

  @override
  State<HomeNotesScreen> createState() => _HomeNotesScreenState();
}

class _HomeNotesScreenState extends State<HomeNotesScreen> {
  @override
  void initState() {
    BlocProvider.of<NotesCubit>(context).getNotes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      floatingActionButton: CustomFloatingActionButton(),
      body: BuildBody(),
    );
  }
}
