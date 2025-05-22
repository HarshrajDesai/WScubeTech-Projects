import 'package:flutter/material.dart';
import 'package:wscude_notes_app/helper/db_helper.dart';
import 'package:wscude_notes_app/widgets/app_bar_button.dart';

class AddNotePage extends StatefulWidget {
  const AddNotePage({super.key});

  @override
  State<AddNotePage> createState() => _AddNotePageState();
}

class _AddNotePageState extends State<AddNotePage> {
  DbHelper dbHelper = DbHelper.getInstance();
  TextEditingController titleController = TextEditingController();
  TextEditingController descController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
        actions: [
          AppBarButton(icon: Icons.save_outlined, onPressed: (){
              dbHelper.addNote(title: titleController.text, desc: descController.text);
            Navigator.pop(context);
            })
          // InkWell(
          //   onTap: () { dbHelper.addNote(title: titleController.text, desc: descController.text);
          //   Navigator.pop(context);},
          //   child: 
          //   // Container(
          //   //   margin: EdgeInsets.only(right: 10),
          //   //   padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
          //   //   decoration: BoxDecoration(
          //   //     shape: BoxShape.rectangle,
          //   //     color: Colors.blue.withOpacity(0.3),
          //   //     borderRadius: BorderRadius.circular(8),
          //   //   ),
          //   //   child: Text(
          //   //     "Save",
          //   //     style: TextStyle(
          //   //       color: Colors.blue.withOpacity(0.7),
          //   //       fontSize: 20,
          //   //     ),
          //   //   ),
          //   // ),
          // ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                controller: titleController,
                style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                decoration: InputDecoration(
                  hintText: "Title",
                  hintStyle: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w400,
                    color: Colors.black38,
                  ),
                  border: InputBorder.none,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                maxLines: null,
                controller: descController,
                keyboardType: TextInputType.multiline,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                decoration: InputDecoration(
                  hintText: "Type something...",
                  hintStyle: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    color: Colors.black54,
                  ),
                  border: InputBorder.none,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
