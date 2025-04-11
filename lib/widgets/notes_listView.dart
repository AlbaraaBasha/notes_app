import 'package:flutter/material.dart';
import 'package:notes_app/widgets/note_item.dart';

class NotesListView extends StatelessWidget {
  const NotesListView({super.key});
  final noteColors = const [
    Color(0xffFFCC80),
    Color(0xff80DEEA),
    Color(0xffFFAB91),
    Color(0xffB39DDB),
    Color(0xff80CBC4),
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(left: 12, bottom: 8, right: 12),
          child: NoteItem(noteColor: noteColors[index % 5]),
        );
      },
    );
  }
}
