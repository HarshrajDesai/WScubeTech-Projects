import 'dart:io';

import 'package:intl/intl.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper {
  static const String TABLE_NAME = "notes";
  static const String COLUMN_NOTE_ID = "note_id";
  static const String COLUMN_NOTE_TITLE = "note_title";
  static const String COLUMN_NOTE_DESC = "note_desc";
  static const String COLUMN_NOTE_DATE = "note_created_at";

  DbHelper._();

  static DbHelper getInstance() {
    return DbHelper._();
  }

  Database? mdb;

  Future<Database> initDb() async {
    if (mdb == null) {
      mdb = await openDb();
      return mdb!;
    } else {
      return mdb!;
    }
  }

  Future<Database> openDb() async {
    Directory appDirectory = await getApplicationCacheDirectory();
    String dbPath = join(appDirectory.path, 'notesdb.db');

    return await openDatabase(
      dbPath,
      version: 1,
      onCreate:
          (db, version) => db.execute(
            "create table $TABLE_NAME($COLUMN_NOTE_ID integer primary key autoincrement, $COLUMN_NOTE_TITLE text, $COLUMN_NOTE_DESC text, $COLUMN_NOTE_DATE text)",
          ),
    );
  }

  void addNote({required String title, required String desc}) async{
    var db = await initDb();
    
    db.insert(TABLE_NAME, {
      COLUMN_NOTE_TITLE: title,
      COLUMN_NOTE_DESC: desc,
      COLUMN_NOTE_DATE: DateTime.now().microsecondsSinceEpoch.toString()
    });
  }

  Future<List<Map<String, dynamic>>> fetchAllNotes() async{
    var db = await initDb();
    return db.query(TABLE_NAME);
  }

  void deleteNote(int id) async{
    var db = await initDb();
    db.delete(TABLE_NAME, where: "$COLUMN_NOTE_ID = ?", whereArgs: ["$id"]);
  }

  void updateNote(int id, {String? title, String? desc}) async{
    var db = await initDb();
    db.update(TABLE_NAME, {
      COLUMN_NOTE_TITLE: title,
      COLUMN_NOTE_DESC: desc
    }, where: "$COLUMN_NOTE_ID = ?", whereArgs: ["$id"]);
  }

}
