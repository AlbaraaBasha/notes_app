import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/read_notes_cubit/read_notes_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/views/modify_note_view.dart';
import 'package:notes_app/widgets/note_item.dart';

class NotesListView extends StatefulWidget {
  const NotesListView({super.key});

  @override
  State<NotesListView> createState() => _NotesListViewState();
}

class _NotesListViewState extends State<NotesListView> {
  @override
  void initState() {
    BlocProvider.of<NotesReadCubit>(context).readNotes();
    super.initState();
  }

  final noteColors = const [
    Color(0xffFFCC80),
    Color(0xff80DEEA),
    Color(0xffFFAB91),
    Color(0xffB39DDB),
    Color(0xff80CBC4),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesReadCubit, NotesReadState>(
      builder: (context, state) {
        List<NoteModel> notes =
            BlocProvider.of<NotesReadCubit>(context).notes ?? [];
        return ListView.builder(
          itemCount: notes.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(left: 12, bottom: 8, right: 12),
              child: GestureDetector(
                onTap:
                    () =>
                        Navigator.pushNamed(context, const ModifyNoteView().id),
                child: NoteItem(
                  noteColor: noteColors[index % 5],
                  note: notes[index],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
