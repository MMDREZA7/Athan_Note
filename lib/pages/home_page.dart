import 'package:athan_notes/models/note.dart';
import 'package:athan_notes/models/note_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final newNoteEditingController = TextEditingController();

  int i = 0;

  void addNote() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.grey[300],
        content: TextField(
          controller: newNoteEditingController,
          decoration: const InputDecoration(
            hintText: 'Note Name',
          ),
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              // save
              MaterialButton(
                color: Colors.grey[500],
                onPressed: saveNote,
                child: Text(
                  'Save',
                  style: TextStyle(
                    color: Colors.grey[300],
                  ),
                ),
              ),

              // cancel
              MaterialButton(
                color: Colors.grey[500],
                onPressed: cancelToSaveNote,
                child: Text(
                  'Cancel',
                  style: TextStyle(
                    color: Colors.grey[300],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

// save process
  void saveNote() {
    i += 1;
    print(i);
    // add new note to allnotes list
    Provider.of<NoteData>(context).addNewNote(
      Note(
        id: i,
        text: newNoteEditingController.text,
      ),
    );

    // exit from dialog
    Navigator.pop(context);
    newNoteEditingController.clear();
  }

// cancel process
  void cancelToSaveNote() {
    Navigator.pop(context);
    newNoteEditingController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<NoteData>(
      builder: (context, value, child) => Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: addNote,
          child: const Icon(Icons.add),
        ),
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        body: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            // heading
            children: [
              const Text(
                'NOTES',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),

              // list of notes
              Expanded(
                child: ListView.builder(
                  itemCount: value.allNotes.length,
                  itemBuilder: (context, index) => Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[500],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.all(5),
                    margin: const EdgeInsets.only(top: 10),
                    child: ListTile(
                      title: Text(
                        value.allNotes[index].text,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
