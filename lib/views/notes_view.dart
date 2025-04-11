import 'package:flutter/material.dart';
import 'package:notes_app/constans.dart';
import 'package:notes_app/widgets/add_note_sheet.dart';
import 'package:notes_app/widgets/costum_search_icon.dart';
import 'package:notes_app/widgets/notes_listView.dart';

class NotesView extends StatelessWidget {
  const NotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) {
              return const AddNoteSheet();
            },
          );
        },
        shape: const CircleBorder(),
        backgroundColor: kPrimaryColor,
        child: const Icon(Icons.add, color: Colors.black),
      ),
      body: const Padding(
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
            SizedBox(height: 10),
            Expanded(child: NotesListView()),
          ],
        ),
      ),
    );
  }
}
