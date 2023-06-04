import 'package:flutter/material.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/widgets/build_form.dart';

class CustomFloatingActionButton extends StatelessWidget {
  const CustomFloatingActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.white,
      child: const Icon(
        Icons.add,
        color: kPrimerColor,
        size: 35,
      ),
      onPressed: () {
        showModalBottomSheet(
          isScrollControlled: true,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            context: context,
            builder: (context) {
              return const SingleChildScrollView(child: BuildForm());
            });
      },
    );
  }
}
