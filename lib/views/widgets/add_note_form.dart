import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:note_app/models/note_model.dart';

import '../../cubits/add_note_cubit/add_note_cubit.dart';
import 'custom_button.dart';
import 'custom_textfiled.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({
    super.key,
  });

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? title, subtitle;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        children: [
          SizedBox(height: 32),
          CustomTextFiled(onSaved: (value) => title = value, hint: 'Title'),
          SizedBox(height: 18),
          CustomTextFiled(
            onSaved: (value) => subtitle = value,
            hint: 'Content',
            maxLines: 5,
          ),
          SizedBox(height: 100),
          BlocBuilder<AddNoteCubit, AddNoteState>(
            builder: (context, state) {
              return CustomButton(
                isLoading: state is AddNoteLoading ? true : false,
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    var formattedDate =
                        DateFormat('dd-MM-yyyy').format(DateTime.now());
                    var noteModel = NoteModel(
                      title: title!,
                      subtitle: subtitle!,
                      date: formattedDate,
                      color: Colors.blue.value,
                    );

                    BlocProvider.of<AddNoteCubit>(context).addNote(noteModel);
                  } else {
                    autovalidateMode = AutovalidateMode.always;
                    setState(() {});
                  }
                },
              );
            },
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
