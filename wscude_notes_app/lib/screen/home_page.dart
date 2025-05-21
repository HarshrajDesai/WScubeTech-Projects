import 'package:flutter/material.dart';
import 'package:wscude_notes_app/helper/db_helper.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DbHelper? dbHelper;
  List<Map<String, dynamic>> notes = [];

  TextEditingController titleController = TextEditingController();
  TextEditingController descController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dbHelper = DbHelper.getInstance();
    getAllNotes();
  }

  void getAllNotes() async {
    notes = await dbHelper!.fetchAllNotes();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Take Notes",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: Colors.amber,
      ),
      body:
          notes.isNotEmpty
              ? ListView.builder(
                itemCount: notes.length,
                itemBuilder: (_, index) {
                  return ListTile(
                    title: Text(notes[index][DbHelper.COLUMN_NOTE_TITLE]),
                    subtitle: Text(notes[index][DbHelper.COLUMN_NOTE_DESC]),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          onPressed: () {
                            ///update the data
                            titleController.text = notes[index][DbHelper.COLUMN_NOTE_TITLE];
                            descController.text = notes[index][DbHelper.COLUMN_NOTE_DESC];
                            showAddNoteBottomOverlay(id: notes[index][DbHelper.COLUMN_NOTE_ID]);
                          },
                          icon: Icon(Icons.edit),
                        ),
                        IconButton(
                          onPressed: () {
                            dbHelper!.deleteNote(notes[index][DbHelper.COLUMN_NOTE_ID]);
                            getAllNotes();
                          },
                          icon: Icon(Icons.delete, color: Colors.red),
                        ),
                      ],
                    ),
                  );
                },
              )
              : Center(child: Text("No Notes yet!!")),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // dbHelper!.addNote(title: "New note", desc: "this is my new note");
          showAddNoteBottomOverlay();
          // getAllNotes();
        },
        child: Icon(Icons.add),
      ),
    );
  }

  void showAddNoteBottomOverlay({int? id, String? title, String? desc}) {
    showModalBottomSheet(
      context: context,
      builder:
          (_) => Container(
            width: double.infinity,
            height: MediaQuery.sizeOf(context).height * 0.5,
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                Text(
                  "Add Note",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 11),
                TextField(
                  controller: titleController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    labelText: 'Title',
                    hintText: 'Enter title',
                  ),
                ),
                SizedBox(height: 11),
                TextField(
                  controller: descController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    labelText: 'Desc',
                    hintText: 'Enter desc',
                  ),
                ),
                SizedBox(height: 11),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    OutlinedButton(
                      onPressed: () {
                        var title = titleController.text;
                        var desc = descController.text;
                        dbHelper!.addNote(title: title, desc: desc);
                        titleController.clear();
                        descController.clear();
                        getAllNotes();
                        Navigator.pop(context);
                      },
                      child: Text('Save'),
                    ),
                    SizedBox(width: 11),
                    OutlinedButton(
                      onPressed: () {
                        dbHelper!.updateNote(id!,title: titleController.text, desc: descController.text);
                        titleController.clear();
                        descController.clear();
                        getAllNotes();
                        Navigator.pop(context);
                      },
                      child: Text('Update'),
                    ),
                    SizedBox(width: 11),
                    OutlinedButton(
                      onPressed: () {
                        Navigator.pop(context);
                        titleController.clear();
                        descController.clear();
                      },
                      child: Text('Cancel'),
                    ),
                  ],
                ),
              ],
            ),
          ),
    );
  }
}
