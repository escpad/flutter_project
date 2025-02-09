import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:my_first_flutter/services/firestore.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  // firestore
  final FirestoreService firestoreService = FirestoreService();

  // text controller
  final TextEditingController textController = TextEditingController();

  // opens note box
  void openNoteBox({String? docID}) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: TextField(
          controller: textController,
        ),
        actions: [
          // button to save
          ElevatedButton(
            onPressed: () {
              // add a new note
              if(docID == null)
              {
                firestoreService.addNote(textController.text);
              }
              else 
              {
                firestoreService.updateNote(docID, textController.text);
              }
              // clear text contoller
              textController.clear();

              // close the box
              Navigator.pop(context);

            },
           child: Text('Add'),
           )
        ]
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notes'),
      ),
      floatingActionButton:
          FloatingActionButton(onPressed: openNoteBox, child: const Icon(Icons.add)
      ),
      body: StreamBuilder(stream: firestoreService.getNotesStream(),
      builder: (context, snapshot) {
        if (snapshot.hasData)
        {
          List notesList = snapshot.data!.docs;

          return ListView.builder(
            itemCount: notesList.length,
            itemBuilder: (context, index) {
              DocumentSnapshot document = notesList[index];
              String docID = document.id;

              Map<String, dynamic> data = 
                document.data() as Map<String, dynamic>;
              String noteText = data['note'];

              return ListTile(
                title: Text(noteText),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Update cog icon button
                    IconButton(
                      onPressed: () => openNoteBox(docID: docID),
                      icon: Icon(MdiIcons.cog)
                    ),
                    // Delete button
                    IconButton(
                      onPressed: () => firestoreService.deleteNote(docID),
                      icon: Icon(MdiIcons.trashCan)
                    ),
                  ]
                )
              );
            }
          );
        }
        else {
          return const Text('No notes');
        }
        


      }
      ),
    );
  }
}
