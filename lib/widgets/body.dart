import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/notes/notes_cubit.dart';
import 'package:notes_app/widgets/custom_appbar.dart';
import 'package:notes_app/widgets/listview.dart';

class BuildBody extends StatelessWidget {
  const BuildBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<NotesCubit>(context);
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children:  [
              const SizedBox(
                height: 25,
              ),
              const CustomAppbar(icon: Icons.search, text: 'Notes'),
              const SizedBox(
                height: 10,
              ),
              const Expanded(
                child: CustomBuildView(),
              ),
              IconButton(onPressed: () {
                cubit.add();
              }, icon: const Icon(Icons.add)),
              Text('${cubit.n}')
            ],
          ),
        );
  }
}
