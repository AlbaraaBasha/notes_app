import 'package:flutter/material.dart';
import 'package:notes_app/widgets/costum_search_icon.dart';
import 'package:notes_app/widgets/note_item.dart';
import 'package:notes_app/widgets/notes_listView.dart';

class NotesView extends StatelessWidget {
  const NotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            SizedBox(height: 50),
            //Costum AppBar
            Row(
              children: [
                Text(
                  'Notes',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                Spacer(),
                CostumSearchIcon(),
              ],
            ),
            SizedBox(height: 20),
            Expanded(child: NotesListView()),
          ],
        ),
      ),
    );
  }
}
