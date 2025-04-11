import 'package:flutter/material.dart';
import 'package:notes_app/widgets/constum_text_field.dart';
import 'package:notes_app/widgets/costum_button.dart';

class AddNoteSheet extends StatelessWidget {
  const AddNoteSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 18),
      child: Column(
        children: [
          SizedBox(height: 40),
          CostumTextField(hintText: 'Title'),
          SizedBox(height: 20),
          CostumTextField(hintText: 'Details', maxLines: 5),
          SizedBox(height: 80),
          CostumButton(),
        ],
      ),
    );
  }
}
