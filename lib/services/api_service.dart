import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/note_model.dart';

class ApiService {
  static const String baseUrl = 'https://jsonplaceholder.typicode.com/posts';

  Future<List<Note>> fetchNotes() async {
    try {
      final response = await http.get(Uri.parse(baseUrl));
      if (response.statusCode == 200) {
        List<dynamic> jsonList = jsonDecode(response.body);
        return jsonList.map((json) => Note.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load notes');
      }
    } catch (e) {
      throw Exception('Could not connect to API');
    }
  }

  Future<Note> createNote(Note note) async {
    try {
      final response = await http.post(
        Uri.parse(baseUrl),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(note.toJson()),
      );
      if (response.statusCode == 201) {
        return Note.fromJson(jsonDecode(response.body));
      } else {
        throw Exception('Failed to create note');
      }
    } catch (e) {
      throw Exception('Could not add note');
    }
  }

  Future<Note> updateNote(Note note) async {
    try {
      final response = await http.put(
        Uri.parse('$baseUrl/${note.id}'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(note.toJson()),
      );
      if (response.statusCode == 200) {
        return Note.fromJson(jsonDecode(response.body));
      } else {
        throw Exception('Failed to update note');
      }
    } catch (e) {
      throw Exception('Could not edit note');
    }
  }

  Future<void> deleteNote(int id) async {
    try {
      final response = await http.delete(Uri.parse('$baseUrl/$id'));
      if (response.statusCode != 200 && response.statusCode != 204) {
        throw Exception('Failed to delete note');
      }
    } catch (e) {
      throw Exception('Could not delete note');
    }
  }
}
