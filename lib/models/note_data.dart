import 'package:athan_notes/models/note.dart';
import 'package:flutter/material.dart';

class NoteData extends ChangeNotifier {
  // overall list of note
  List<Note> allNotes = [
    // default first notes
    Note(id: 0, text: 'First note'),
  ];

  // get notes
  List<Note> getAllNotes() {
    return allNotes;
  }

  // add new note
  void addNewNote(Note note) {
    allNotes.add(note);

    notifyListeners();
  }

  // update note
  void updateNote(Note note, String text) {
    // go thru list of all notes
    for (int i = 0; i < allNotes.length; i++) {
      // find the relevant note
      if (allNotes[i].id == note.id) {
        // replace text
        allNotes[i].text = text;
      }
    }

    notifyListeners();
  }

  // delete note
  void deleteNote(Note note) {
    allNotes.remove(note);
  }

  notifyListeners();
}
