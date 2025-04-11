import 'package:flutter/material.dart';
import 'package:notes_app/widgets/constum_text_field.dart';
import 'package:notes_app/widgets/costum_button.dart';

class AddNoteSheet extends StatelessWidget {
  const AddNoteSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 18),
      child: AddNoteForm(),
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
                Navigator.pop(context);
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
