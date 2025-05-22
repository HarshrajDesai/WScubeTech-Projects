import 'package:flutter/material.dart';
import 'package:wscude_notes_app/screen/add_note_page.dart';
import 'package:wscude_notes_app/screen/home_page.dart';
import 'package:wscude_notes_app/screen/note_page.dart';

class AppRoutes {
  static const String home = "/";
  static const String note = "/note";
  static const String addNote = "/addnote";

  static Map<String, WidgetBuilder> getRoutes(){
    return {
      home: (_) => HomePage(),
      note: (_) => NotePage(),
      addNote: (_) => AddNotePage(),
    };
  }
}