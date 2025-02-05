import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:note_app/models/note_model.dart';

import 'custom_app_bar.dart';
import 'custom_textfiled.dart';

class EditNoteViewBody extends StatefulWidget {
  const EditNoteViewBody({super.key, required this.note});
  final NoteModel note;

  @override
  State<EditNoteViewBody> createState() => _EditNoteViewBodyState();
}

class _EditNoteViewBodyState extends State<EditNoteViewBody> {
  String? title, content;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22),
      child: Column(
        children: [
          const SizedBox(height: 35),
          CustomAppBar(
            title: 'Edit Note',
            icon: Icons.check,
            onPressed: () {
              confirmEdit(context);
            },
          ),
          const SizedBox(height: 35),
          CustomTextFiled(
            hint: widget.note.title,
            onChanged: (value) => title = value,
          ),
          const SizedBox(height: 18),
          CustomTextFiled(
              hint: widget.note.subtitle,
              onChanged: (value) => content = value,
              maxLines: 5),
        ],
      ),
    );
  }

  Future<dynamic> confirmEdit(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Confirm Edit"),
          content:
              const Text("Are you sure you want to save changes to this note?"),
          actions: [
            TextButton(
              onPressed: () {
                // Cancel the edit
                Navigator.of(context).pop();
              },
              child: const Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                // Perform the edit action
                // Call your edit function here
                // For example: note.edit();
                widget.note.title = title ?? widget.note.title;
                widget.note.subtitle = content ?? widget.note.subtitle;
                widget.note.save();
                Navigator.pop(context);
                BlocProvider.of<NotesCubit>(context).fetchAllNotes();
                Navigator.of(context).pop();
              },
              child: const Text("Confirm"),
            ),
          ],
        );
      },
    );
  }
}
