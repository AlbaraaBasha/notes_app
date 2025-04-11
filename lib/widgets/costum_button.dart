import 'package:flutter/material.dart';
import 'package:notes_app/constans.dart';

class CostumButton extends StatelessWidget {
  const CostumButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 50,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: kPrimaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
        child: const Text('Add Note', style: TextStyle(color: Colors.black)),
      ),
    );
  }
}
