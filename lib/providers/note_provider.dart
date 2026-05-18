import 'package:flutter/material.dart';
import '../models/note_model.dart';
import '../services/api_service.dart';

class NoteProvider extends ChangeNotifier {
  final ApiService _apiService = ApiService();

  List<Note> _notes = [
    Note(id: 1, title: "Ruth's Hobbies", body: "Ruth likes to cook food and play piano.k"),
    Note(id: 2, title: "Darik's Favorite Team", body: "Darik is a passionate Manchester United supporter!"),
  ];

  bool _isLoading = false;
  String _errorMessage = '';

  List<Note> get notes => _notes;
  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;

  Future<void> fetchNotes() async {
    _isLoading = true;
    _errorMessage = '';
    notifyListeners();

    try {
      await _apiService.fetchNotes();
    } catch (e) {
      _errorMessage = 'Could not load notes';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> addNote(String title, String body) async {
    _isLoading = true;
    _errorMessage = '';
    notifyListeners();

    try {
      final newNote = Note(title: title, body: body);
      final createdNote = await _apiService.createNote(newNote);

      int nextId = 1;
      if (_notes.isNotEmpty) {
        nextId = _notes.map((n) => n.id ?? 0).reduce((a, b) => a > b ? a : b) + 1;
      }
      createdNote.id = nextId;

      _notes.add(createdNote);
    } catch (e) {
      _errorMessage = 'Could not add note';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> updateNote(Note note) async {
    _isLoading = true;
    _errorMessage = '';
    notifyListeners();

    try {
      await _apiService.updateNote(note);

      int index = _notes.indexWhere((n) => n.id == note.id);
      if (index != -1) {
        _notes[index] = note;
      }
    } catch (e) {
      _errorMessage = 'Could not edit note';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> deleteNote(int id) async {
    _isLoading = true;
    _errorMessage = '';
    notifyListeners();

    try {
      await _apiService.deleteNote(id);

      _notes.removeWhere((note) => note.id == id);
    } catch (e) {
      _errorMessage = 'Could not delete note';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
