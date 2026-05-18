import 'package:flutter/material.dart';
import '../models/note_model.dart';

class NoteDetailsScreen extends StatelessWidget {
  final Note note;
  const NoteDetailsScreen({super.key, required this.note});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F9F8),
      appBar: AppBar(
        title: const Text('Note Details', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: const Color(0xFF009688),
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: const Color(0xFF009688), width: 2),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                note.title,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF009688),
                ),
              ),
              const SizedBox(height: 12),
              const Divider(color: Color(0xFF009688), thickness: 1.5),
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
    );
  }
}
