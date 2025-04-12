import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widgets/constum_text_field.dart';
import 'package:notes_app/widgets/costum_button.dart';

class AddNoteSheet extends StatelessWidget {
  const AddNoteSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddNoteCubit, AddNoteState>(
      listener: (context, state) {
        if (state is AddNoteFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.error), backgroundColor: Colors.red),
          );
        } else if (state is AddNoteSuccess) {
          Navigator.pop(context);
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Note added successfully!'),
              backgroundColor: Colors.green,
            ),
          );
        }
      },
      builder: (context, state) {
        return AbsorbPointer(
          absorbing: state is AddNoteLoading ? true : false,
          child: Padding(
            padding: EdgeInsets.only(
              right: 16,
              left: 16,
              bottom: MediaQuery.of(context).viewInsets.bottom + 10,
            ),
            child: const SingleChildScrollView(child: AddNoteForm()),
          ),
        );
      },
    );
  }
}

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({super.key});

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? title, subtitle;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        children: [
          const SizedBox(height: 40),
          CostumTextFormField(
            hintText: 'Title',
            onSaved: (value) {
              title = value;
              return null;
            },
          ),
          const SizedBox(height: 20),
          CostumTextFormField(
            hintText: 'Details',
            maxLines: 5,
            onSaved: (value) {
              subtitle = value;
              return null;
            },
          ),
          const SizedBox(height: 80),
          CostumButton(
            onPressed: () {
              if (formKey.currentState!.validate()) {
                formKey.currentState!.save();
                BlocProvider.of<AddNoteCubit>(context).addNote(
                  NoteModel(
                    title: title!,
                    subtitle: subtitle!,
                    date: DateFormat.yMEd().format(DateTime.now()),
                  ),
                );
              } else {
                setState(() {
                  autovalidateMode = AutovalidateMode.onUserInteraction;
                });
              }
            },
          ),
        ],
      ),
    );
  }
}
