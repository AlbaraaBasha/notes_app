import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notes_app/constans.dart';
import 'package:notes_app/views/modify_note_view.dart';
import 'package:notes_app/views/notes_view.dart';

void main() async {
  runApp(const NotesApp());
  await Hive.initFlutter();
  await Hive.openBox(kNotesBox);
}

class NotesApp extends StatelessWidget {
  const NotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {const ModifyNoteView().id: (context) => const ModifyNoteView()},
      title: 'Notes',
      theme: ThemeData(brightness: Brightness.dark, fontFamily: 'Poppins'),
      home: const NotesView(),
    );
  }
}
