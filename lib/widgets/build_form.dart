import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/add_notes_cubit/add_notes_cubit.dart';
import 'package:notes_app/cubits/notes/notes_cubit.dart';
import 'package:notes_app/model/notes_model.dart';
import 'package:notes_app/widgets/chosse_color.dart';
import 'package:notes_app/widgets/custom_Button.dart';
import 'package:notes_app/widgets/custom_text_field.dart';

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
    return BlocProvider(
      create: (context) => AddNotesCubit(),
      child: BlocConsumer<AddNotesCubit, AddNotesState>(
        listener: (context, state) {
          if (state is AddNotesSuccess) {
            BlocProvider.of<NotesCubit>(context).getNotes();
            Navigator.pop(context);
          }
        },
        builder: (context, state) {
          return AbsorbPointer(
            absorbing: state is AddNotesLoading ? true : false,
            child: Form(
              key: formKey,
              autovalidateMode: autoValidateMode,
              child: Padding(
                padding: EdgeInsets.only(
                    left: 24,
                    right: 24,
                    top: 24,
                    bottom: MediaQuery.of(context).viewInsets.bottom),
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
                      height: 15,
                    ),
                     SizedBox(
                      height: 80,
                        child: ChooseColor()),
                    const SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: CustomButton(
                        isLoading: state is AddNotesLoading ? true : false,
                        text: 'Add',
                        onTap: () {
                          if (formKey.currentState!.validate()) {
                            formKey.currentState!.save();
                            var notesModel = NotesModel(
                                subTitle: subTitle!,
                                title: title!,
                                color: BlocProvider.of<NotesCubit>(context).color?.value ?? const Color(0xfff44336).value,
                                date: DateTime.now().toString());
                            BlocProvider.of<AddNotesCubit>(context)
                                .addNotes(notesModel, context);
                          } else {
                            autoValidateMode = AutovalidateMode.always;
                            setState(() {});
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
