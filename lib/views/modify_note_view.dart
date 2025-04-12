import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:notes_app/constans.dart';
import 'package:notes_app/cubits/read_notes_cubit/read_notes_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widgets/constum_text_field.dart';
import 'package:notes_app/widgets/costum_search_icon.dart';

class ModifyNoteView extends StatelessWidget {
  const ModifyNoteView({super.key});
  final id = 'modifynote';

  @override
  Widget build(BuildContext context) {
    final note = ModalRoute.of(context)!.settings.arguments as NoteModel;
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
                    note.save();
                    BlocProvider.of<NotesReadCubit>(context).readNotes();
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
            const SizedBox(height: 40),
            CostumTextFormField(
              hintText: 'Note',
              content: note.title,
              onChanged: (value) {
                note.title = value;
              },
            ),
            const SizedBox(height: 20),
            CostumTextFormField(
              onChanged: (value) {
                note.subtitle = value;
              },
              hintText: 'Details',
              maxLines: 5,
              content: note.subtitle,
            ),
          ],
        ),
      ),
    );
  }
}
