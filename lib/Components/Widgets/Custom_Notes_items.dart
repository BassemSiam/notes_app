import 'package:flutter/material.dart';
import 'package:note_app/Models/note_model.dart';
import 'package:note_app/Screens/Edit_notes_screen.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({super.key, required this.notes});

  final NoteModel notes;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => EditNoteScreen(),
            ));
      },
      child: Container(
        padding: EdgeInsets.only(top: 24, bottom: 24, left: 16),
        decoration: BoxDecoration(
          color: Color(notes.color),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ListTile(
              textColor: Colors.black,
              iconColor: Colors.black,
              title: Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: Text(
                  notes.title,
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                ),
              ),
              subtitle: Text(
                notes.title,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black.withOpacity(0.6),
                ),
              ),
              trailing: IconButton(
                icon: Icon(
                  Icons.delete,
                  size: 35,
                ),
                onPressed: () {
                  notes.delete();
                },
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 24),
              child: Text(
                notes.date,
                style: TextStyle(
                    fontSize: 16, color: Colors.black.withOpacity(0.6)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
