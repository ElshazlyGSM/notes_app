import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/notes/notes_cubit.dart';

class ChooseColor extends StatefulWidget {
 const ChooseColor({super.key});

  @override
  ChooseColorState createState() => ChooseColorState();
}

class ChooseColorState extends State<ChooseColor> {
  bool showWhiteCircle = false;

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<NotesCubit>(context);
    return Center(
      child: ListView.builder(
          itemCount: 18,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  cubit.color = Colors.primaries[index];
                  showWhiteCircle = true;
                });
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 3),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    if (showWhiteCircle &&
                        cubit.color == Colors.primaries[index])
                      const CircleAvatar(
                        radius: 38,
                        backgroundColor: Colors.white,
                      ),
                    CircleAvatar(
                      radius: 35,
                      backgroundColor: Colors.primaries[index],
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
