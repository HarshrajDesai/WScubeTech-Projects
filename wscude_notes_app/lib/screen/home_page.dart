import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:path/path.dart';
import 'package:wscude_notes_app/helper/db_helper.dart';
import 'package:wscude_notes_app/routes/app_routes.dart';
import 'package:wscude_notes_app/widgets/app_bar_button.dart';
import 'package:wscude_notes_app/widgets/notes_container.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DbHelper? dbHelper;
  DateFormat df = DateFormat.yMMMEd();
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
          "Notes",
          style: TextStyle(
            fontWeight: FontWeight.w500,
            color: Colors.black,
            fontSize: 30,
          ),
        ),
        actions: [AppBarButton(icon: Icons.search, onPressed: () {})],
      ),
      body:
          notes.isNotEmpty
              ? RefreshIndicator(
                onRefresh: () async {
                  getAllNotes();
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: GridView.builder(
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisSpacing: 10,
                      childAspectRatio: 1,
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                    ),
                    scrollDirection: Axis.vertical,
                    itemCount: notes.length,
                    itemBuilder: (context, index) {
                      var eachDate = df.format(
                        DateTime.fromMicrosecondsSinceEpoch(
                          int.parse(notes[index][DbHelper.COLUMN_NOTE_DATE]),
                        ),
                      );
                      var color;

                      if(index % 2 == 0 && index % 4 == 0){
                        color = Colors.pink[200];
                      }
                      else if(index % 2 == 0){
                        color = Colors.amber[300];
                      }
                      else {
                        color = Colors.blue[300];
                      }
                      return Stack(
                        children: [
                          InkWell(
                            onTap:
                                () => Navigator.pushNamed(
                                  context,
                                  AppRoutes.note,
                                  arguments: {
                                    'id': notes[index][DbHelper.COLUMN_NOTE_ID],
                                    'title':
                                        notes[index][DbHelper
                                            .COLUMN_NOTE_TITLE],
                                    'desc':
                                        notes[index][DbHelper.COLUMN_NOTE_DESC],
                                  },
                                ),
                            child: NotesContainer(
                              title: notes[index][DbHelper.COLUMN_NOTE_TITLE],
                              date: eachDate,
                              color: color,
                            ),
                          ),
                          Positioned(
                            right: 10,
                            bottom: 10,
                            child: InkWell(
                              onTap: () {
                                dbHelper!.deleteNote(
                                  notes[index][DbHelper.COLUMN_NOTE_ID],
                                );
                                getAllNotes();
                              },
                              child: Icon(
                                Icons.delete_outline,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                  // ListTile(
                  //   title: Text(notes[index][DbHelper.COLUMN_NOTE_TITLE]),
                  //   subtitle: Text(notes[index][DbHelper.COLUMN_NOTE_DESC]),
                  //   trailing: Row(
                  //     mainAxisSize: MainAxisSize.min,
                  //     // mainAxisAlignment: MainAxisAlignment.end,
                  //     crossAxisAlignment: CrossAxisAlignment.end,
                  //     children: [
                  //       IconButton(
                  //         onPressed: () {
                  //           ///update the data
                  //           titleController.text = notes[index][DbHelper.COLUMN_NOTE_TITLE];
                  //           descController.text = notes[index][DbHelper.COLUMN_NOTE_DESC];
                  //           showAddNoteBottomOverlay(id: notes[index][DbHelper.COLUMN_NOTE_ID]);
                  //         },
                  //         icon: Icon(Icons.edit),
                  //       ),
                  //       IconButton(
                  //         onPressed: () {
                  //           dbHelper!.deleteNote(notes[index][DbHelper.COLUMN_NOTE_ID]);
                  //           getAllNotes();
                  //         },
                  //         icon: Icon(Icons.delete, color: Colors.red),
                  //       ),
                  //     ],
                  //   ),
                  // );
                ),
              )
              : RefreshIndicator(
                onRefresh: () async {
                  getAllNotes();
                },
                child: Container(
                  height: MediaQuery.sizeOf(context).height,
                  width: MediaQuery.sizeOf(context).width,
                  child: Center(child: Text("No Notes yet!!")),
                ),
              ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue[200],
        onPressed: () {
          // dbHelper!.addNote(title: "New note", desc: "this is my new note");
          // showAddNoteBottomOverlay(context);
          Navigator.pushNamed(context, AppRoutes.addNote);
          // getAllNotes();
        },
        child: Icon(Icons.add),
      ),
    );
  }

  void showAddNoteBottomOverlay(
    BuildContext context, {
    int? id,
    String? title,
    String? desc,
  }) {
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
                        dbHelper!.updateNote(
                          id!,
                          title: titleController.text,
                          desc: descController.text,
                        );
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
