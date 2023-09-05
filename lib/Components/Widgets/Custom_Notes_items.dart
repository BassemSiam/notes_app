import 'package:flutter/material.dart';
class NoteItem extends StatelessWidget {
  const NoteItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 24, bottom: 24, left: 16),
      decoration: BoxDecoration(
        color: Color(0xffFFcc80),
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
                'Flutter Tips',
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              ),
            ),
            subtitle: Text(
              'Build your career with Bassem Siam',
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
              onPressed: () {},
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 24),
            child: Text(
              'May 22, 2023',
              style:
                  TextStyle(fontSize: 16, color: Colors.black.withOpacity(0.6)),
            ),
          )
        ],
      ),
    );
  }
}
