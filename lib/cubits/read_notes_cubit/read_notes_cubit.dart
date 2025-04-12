import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:notes_app/constans.dart';
import 'package:notes_app/models/note_model.dart';

part 'read_notes_state.dart';

class NotesReadCubit extends Cubit<NotesReadState> {
  NotesReadCubit() : super(NotesReadInitial());
  List<NoteModel>? notes;
  void readNotes() {
    var noteBox = Hive.box<NoteModel>(kNotesBox);
    notes = noteBox.values.toList();
    emit(NotesReadSuccess());
  }
}
