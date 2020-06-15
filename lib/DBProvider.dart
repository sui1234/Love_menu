import 'dart:async';
import 'dart:io'as io;
import 'dart:io';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'menu.dart';
import 'package:path_provider/path_provider.dart';
import 'package:love_menu/menu.dart';


class DBProvider{


  //DBProvider();
  DBProvider._();
  static final DBProvider dbProvider = DBProvider._();
  static Database _db;

  static const String ID = 'id';
  static const String NAME = 'name';
  static const String TABLE = 'menus';
  //static const String DB_NAME = 'menu_db';

  //get database, if there is database => return the databse, else => create a new database
Future <Database> get database async{
  if(_db != null){
    return _db;
  }

  _db = await initDBInstance();
  return _db;
}

// create new database

  initDBInstance() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "menu_db.db");
    return await openDatabase(path, version: 1, onCreate: (Database db, int version) async {
      await db.execute("CREATE TABLE menus ("
          "id integer primary key,"
          "name TEXT,"
          "ingredient TEXT,"
          "step TEXT"
          ")");
    });
  }

// get all menus from database
  Future <List<Menu>> getAllMenus() async {
    final db = await database;
    var response = await db.query(TABLE);

    List<Menu> list = response.map((c) => Menu.fromMap(c)).toList();
    return list;
  }

  //get on menu according to one id
  Future <Menu> getMenuAId(int id) async {
    final db = await database;
    var res =await db.query(TABLE, where: "id = ?", whereArgs: [id]);
    return res.isNotEmpty ? Menu.fromMap(res.first) : Null ;
  }


  Future<Menu> insert(Menu menu) async {
    final db = await database;
    menu.id = await db.insert(TABLE, menu.toMap());
    return menu;
  }


  Future<int> delete(int id) async {
    final db = await database;

    return await db.delete(
      TABLE,
      where: "id = ?",
      whereArgs: [id],
    );
  }

  Future<int> update(Menu menu) async {
    final db = await database;

    return await db.update(
      TABLE,
      menu.toMap(),
      where: "id = ?",
      whereArgs: [menu.id],
    );
  }

  Future close() async{
    var dbClient = await database;
    dbClient.close();
  }

}


