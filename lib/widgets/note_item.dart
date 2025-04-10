import 'package:flutter/material.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20, top: 20, bottom: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Color(0xffFFCC80),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          ListTile(
            title: Text(
              'Flutter Tips',
              style: TextStyle(color: Colors.black, fontSize: 24),
            ),
            subtitle: Padding(
              padding: const EdgeInsets.only(top: 8, bottom: 16),
              child: Text(
                'Build your career with Albaraa Basha',
                style: TextStyle(
                  color: Colors.black.withValues(alpha: .5),
                  fontSize: 18,
                ),
              ),
            ),

            trailing: IconButton(
              onPressed: () {},
              icon: Icon(Icons.delete, color: Colors.black, size: 30),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 24),
            child: Text(
              'April 10 ,2025',
              style: TextStyle(
                color: Colors.black.withValues(alpha: 0.4),
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
