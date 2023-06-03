import 'package:flutter/material.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/widgets/custom_Button.dart';
import 'package:notes_app/widgets/custom_text_field.dart';

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
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            context: context,
            builder: (context) {
              return const BuildForm();
            });
      },
    );
  }
}

class BuildForm extends StatefulWidget {
  const BuildForm({Key? key}) : super(key: key);

  @override
  State<BuildForm> createState() => _BuildFormState();
}

class _BuildFormState extends State<BuildForm> {
  GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  String? title, subTitle;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autoValidateMode,
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            CustomFormTextField(
              hintText: 'title',
              onSaved: (value) {
                title = value;
              },
            ),
            const SizedBox(
              height: 10,
            ),
            CustomFormTextField(
              maxLines: 5,
              hintText: 'subject',
              onSaved: (value) {
                subTitle = value;
              },
            ),
            const SizedBox(
              height: 30,
            ),
            CustomButton(
              text: 'Add',
              onTap: () {
                print('object');
                if (formKey.currentState!.validate()) {
                  formKey.currentState!.save();
                }else{
                  autoValidateMode = AutovalidateMode.always;
                  setState(() {

                  });
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}