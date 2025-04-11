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
        padding: const EdgeInsets.symmetric(),
        child: Column(
          children: [
            const SizedBox(height: 60),
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
            const CostumTextField(hintText: 'Note'),
            const SizedBox(height: 20),
            const CostumTextField(hintText: 'Details', maxLines: 5),
          ],
        ),
      ),
    );
  }
}
