import 'package:flutter/material.dart';
import 'package:wscude_notes_app/helper/db_helper.dart';
import 'package:wscude_notes_app/widgets/app_bar_button.dart';

class NotePage extends StatefulWidget {
  const NotePage({super.key});

  @override
  State<NotePage> createState() => _NotePageState();
}

class _NotePageState extends State<NotePage> {

  DbHelper dbHelper = DbHelper.getInstance();
  TextEditingController titleController = TextEditingController();
  TextEditingController descController = TextEditingController();
  
  // String? title;
  // String? desc;
  int? id;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    final args = ModalRoute.of(context)!.settings.arguments as Map<String,dynamic>;
    id = args['id'];
    titleController.text = args['title'];
    descController.text = args['desc'];
    print(id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          AppBarButton(icon: Icons.edit_note_outlined, onPressed: (){
            dbHelper.updateNote(id!, title: titleController.text, desc: descController.text);
            Navigator.pop(context);
          })
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