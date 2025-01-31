import 'package:flutter/material.dart';
import 'package:note_app/views/widgets/custom_textfiled.dart';

class CustomBtmSheet extends StatelessWidget {
  const CustomBtmSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          SizedBox(height: 32),
          CustomTextFiled( hint: 'Title'),
          SizedBox(height: 32),
          CustomTextFiled( hint: 'Content', maxLines: 5),
          SizedBox(height: 32),
        ],
      ),
    );
  }
}