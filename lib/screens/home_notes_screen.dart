import 'package:flutter/material.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/widgets/custom_ShowModalBottomSheet.dart';
import 'package:notes_app/widgets/custom_appbar.dart';
import '../widgets/custom_notes.dart';

class HomeNotesScreen extends StatelessWidget {
  const HomeNotesScreen({Key? key}) : super(key: key);
  static String id = 'homeNotesScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        child: const Icon(
          Icons.add,
          color: kPrimerColor,
          size: 35,
        ),
        onPressed: () {
          customShowModalBottomSheet(context);
        },
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(
              height: 25,
            ),
             const CustomAppbar(icon: Icons.search,text: 'Notes'),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: ListView.builder(
                  padding: const EdgeInsets.all(0),
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return const CustomNote();
                  }),
            ),

          ],
        ),
      ),
    );
  }
}
