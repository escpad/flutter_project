import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:my_first_flutter/pages/usersettings.dart';
import 'package:my_first_flutter/services/firestore.dart';
import 'package:google_fonts/google_fonts.dart';

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
            style: GoogleFonts.roboto(
                textStyle: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: 18)),
            controller: textController,
          ),
          actions: [
            // button to save
            ElevatedButton(
              onPressed: () {
                // add a new note
                if (docID == null) {
                  firestoreService.addNote(textController.text);
                } else {
                  firestoreService.updateNote(docID, textController.text);
                }
                // clear text contoller
                textController.clear();

                // close the box
                Navigator.pop(context);
              },
              child: Text('Add'),
            )
          ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Notes',
          style: GoogleFonts.raleway(
              textStyle: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 32)),
        ),
        actions: [
          // usersettings button
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) =>
                            const UserSettings()));
              },
              icon: Icon(MdiIcons.accountBox))
        ],
      ),
      backgroundColor: Colors.white,

      // add note button
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: openNoteBox,
        child: const Icon(color: Colors.black, Icons.add),
      ),
      body: StreamBuilder(
          stream: firestoreService.getNotesStream(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
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
                        title: Text(noteText,
                            style: GoogleFonts.roboto(
                                fontWeight: FontWeight.w400, fontSize: 18)),
                        trailing:
                            Row(mainAxisSize: MainAxisSize.min, children: [
                          // update cog icon button
                          IconButton(
                              onPressed: () => openNoteBox(docID: docID),
                              icon: Icon(MdiIcons.cog)),
                          // delete button
                          IconButton(
                              onPressed: () =>
                                  firestoreService.deleteNote(docID),
                              icon: Icon(MdiIcons.trashCan)),
                        ]));
                  });
            } else {
              return const Text('No notes');
            }
          }),
    );
  }
}
