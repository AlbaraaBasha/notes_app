import 'package:flutter/material.dart';
import 'package:notes_app/widgets/constum_text_field.dart';
import 'package:notes_app/widgets/costum_search_icon.dart';

class ModifyNoteView extends StatelessWidget {
  const ModifyNoteView({super.key});
  final id = 'modifynote';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 16),
        child: Column(
          children: [
            Row(
              children: [
                const Text(
                  'Notes',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                CostumSearchIcon(
                  icon: Icons.check,
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
            const SizedBox(height: 40),
            const CostumTextFormField(hintText: 'Note'),
            const SizedBox(height: 20),
            const CostumTextFormField(hintText: 'Details', maxLines: 5),
          ],
        ),
      ),
    );
  }
}
