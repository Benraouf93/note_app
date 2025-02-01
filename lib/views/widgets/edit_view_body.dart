import 'package:flutter/material.dart';

import 'custom_app_bar.dart';
import 'custom_textfiled.dart';

class EditNoteViewBody extends StatelessWidget {
  const EditNoteViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 22),
      child: Column(
        children: [
          SizedBox(height: 35),
          CustomAppBar(title: 'Edit Note', icon: Icons.check),
          SizedBox(height: 35),
          CustomTextFiled(hint: 'Title'),
          SizedBox(height: 18),
          CustomTextFiled(hint: 'Content', maxLines: 5),
        ],
      ),
    );
  }
}
