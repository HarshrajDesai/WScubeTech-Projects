import 'package:flutter/material.dart';
import 'package:wscude_notes_app/helper/db_helper.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DbHelper? dbHelper;
  List<Map<String,dynamic>> notes = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dbHelper = DbHelper.getInstance();
    getAllNotes();
  }

  void getAllNotes() async{
    notes = await dbHelper!.fetchAllNotes();
    setState(() {
      
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Take Notes", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),),
        backgroundColor: Colors.amber,
      ),
      body: notes.isNotEmpty ?  ListView.builder(
              itemCount: notes.length, itemBuilder: (_, index) {
                return ListTile(
                  title: Text(notes[index][DbHelper.COLUMN_NOTE_TITLE]),
                  subtitle: Text(notes[index][DbHelper.COLUMN_NOTE_DESC]),
                  trailing: SizedBox(
                    width: 100,
                    child: Row(
                      children: [
                        IconButton(onPressed: (){
                          ///update the data
                        }, icon: Icon(Icons.edit,)),
                        IconButton(onPressed: (){
                          // dbHelper!.deleteNote(mNotes[index][DBHelper.COLUMN_NOTE_ID]);
                          getAllNotes();
                        }, icon: Icon(Icons.delete, color: Colors.red,)),
                      ],
                    ),
                  ),
                );
      })
          : Center(
              child: Text("No Notes yet!!"),
            ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        dbHelper!.addNote(title: "New note", desc: "this is my new note");
        getAllNotes();
      }, child: Icon(Icons.add),),
    );
  }
}