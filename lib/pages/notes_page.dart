import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notes_app/models/note_database.dart';
import 'package:provider/provider.dart';

import '../models/note.dart';

class NotesPage extends StatefulWidget {
  const NotesPage({super.key});

  @override
  State<NotesPage> createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  // text controller to access what the user typed
  final textController = TextEditingController();

// on app startup fetch existing notes
  @override
  void initState() {
    super.initState();
    readNotes();
  }

  // create a note
  void createNote() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Add New Note'),
        content: TextField(
          controller: textController,
        ),
        actions: [
          // create button
          MaterialButton(
            onPressed: () {
              //add to db
              context.read<NoteDatabase>().addNote(textController.text);
              //clear controller
              textController.clear();

              // pop dialog box
              Navigator.pop(context);
            },
            child: const Text('Create'),
          )
        ],
      ),
    );
  }

  // read notes
  void readNotes() {
    context.read<NoteDatabase>().fetchNotes();
  }

  //upadte a note
  void updateNotes(Note note) {
    // pre-fill the current note text
    textController.text = note.text;
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: const Text('Update Note'),
              content: TextField(
                controller: textController,
              ),
              actions: [
                //update button
                MaterialButton(
                  onPressed: () {
                    context
                        .read<NoteDatabase>()
                        .updateNote(note.id, textController.text);
                    //clear controller
                    textController.clear();
                    // pop dialog box
                    Navigator.pop(context);
                  },
                  child: const Text('Update'),
                ),
              ],
            ));
  }

  //delete a note
  void deleteNotes(int id) {
    context.read<NoteDatabase>().deleteNote(id);
  }

  @override
  Widget build(BuildContext context) {
// noted database

    final noteDatabase = context.watch<NoteDatabase>();

//current notes
    List<Note> currentNotes = noteDatabase.currentNotes;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      floatingActionButton: FloatingActionButton(
        onPressed: createNote,
        child: const Icon(Icons.add),
      ),
      drawer: Drawer(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //HEADING
          Padding(
            padding: const EdgeInsets.only(left: 25),
            child: Text(
              'Notes',
              style: GoogleFonts.dmSerifText(
                fontSize: 48,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ),
          ),

          //LIST OF NOTES
          Expanded(
            child: ListView.builder(
                itemCount: currentNotes.length,
                itemBuilder: (context, index) {
                  //get individual note
                  final note = currentNotes[index];

                  //list tile UI
                  return ListTile(
                    title: Text(note.text),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        //edit button
                        IconButton(
                            onPressed: () {
                              updateNotes(note);
                            },
                            icon: const Icon(Icons.edit)),

                        //delete button
                        IconButton(
                            onPressed: () {
                              deleteNotes(note.id);
                            },
                            icon: const Icon(Icons.delete))
                      ],
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
