import 'package:flutter/material.dart';
import '../models/note_model.dart';
import '../widgets/aesthetic_background.dart';

class NoteDetailsScreen extends StatelessWidget {
  final Note note;
  const NoteDetailsScreen({super.key, required this.note});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Note Details', style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: AestheticBackground(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(24),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFFFF85A1).withOpacity(0.1),
                  blurRadius: 15,
                  offset: const Offset(0, 5),
                ),
              ],
              border: Border.all(color: const Color(0xFFFF85A1).withOpacity(0.2), width: 1.5),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  note.title,
                  style: const TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFF2709C),
                    letterSpacing: 0.5,
                  ),
                ),
                const SizedBox(height: 12),
                Divider(color: const Color(0xFFFF85A1).withOpacity(0.3), thickness: 2),
                const SizedBox(height: 16),
                Text(
                  note.body,
                  style: const TextStyle(
                    fontSize: 16,
                    height: 1.5,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

