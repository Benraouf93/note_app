import 'package:flutter/material.dart';
import 'package:note_app/views/widgets/custom_textfiled.dart';
import 'custom_button.dart';

class CustomBtmSheet extends StatelessWidget {
  const CustomBtmSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        child: const Column(
          children: [
            SizedBox(height: 32),
            CustomTextFiled( hint: 'Title'),
            SizedBox(height: 18),
            CustomTextFiled( hint: 'Content', maxLines: 5),
            SizedBox(height: 100),
            CustomButton(),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

