import 'dart:async';
import 'dart:io'as io;
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'menu.dart';
import 'package:path_provider/path_provider.dart';


class DBHelper{
  static Database _db;
  static const String ID = 'id';
  static const String NAME = 'name';
  static const String INGREDIENTS = 'ingredients';
  static const String STEPS = 'steps';
  static const String TABLE = 'Menu';
  static const String DB_NAME = 'menu_db';

Future <Database> get db async{
  if(_db != null){
    return _db;
  }

  _db = await initDb();
  return _db;
}

  initDb() async {
    io.Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, DB_NAME);
    var db = await openDatabase(path,version: 1,onCreate: _onCreate);
    return db;

  }
  
_onCreate(Database db, int version) async{
  await db
      .execute("CREATE TABLE $TABLE ($ID INTEGER PRIMARY KEY,$NAME TEXT,$INGREDIENTS TEXT,$STEPS TEXT)");
}

Future<Menu> save (Menu menu)async{
  var dbClient = await db;
  menu.id = await dbClient.insert(TABLE, menu.toMap());

  await dbClient.transaction((txn) async{
    var query  = "INSERT INTO $TABLE($NAME) VALUES ('" +menu.name +"')";
    return await txn.rawInsert(query);
  });
}


Future<List<Menu>> getMenus() async{
  var dbClient = await db;
  List <Map> maps = await dbClient.query(TABLE,columns: [ID,NAME,INGREDIENTS,STEPS]);
  //WE CAN DO THIS ALSO
  //List <Map> maps = await dbClient.rawQuery("SELECT * FROM $TABLE");

  List<Menu> menus = [];
  if(maps.length > 0){
    for(int i = 0; i < maps.length; i++){
      menus.add(Menu.fromMap(maps[i]));
    }
  }
  return menus;
}


Future <int> delete(int id) async{
  var dbClient = await db;
  return await dbClient.delete(TABLE,where: '$ID = ?', whereArgs: [id]);
}

Future <int> update(Menu menu) async{
  var dbClient = await db;
  return await dbClient.update(TABLE, menu.toMap(),
  where: '$ID = ?',whereArgs: [menu.id]);
}

Future close() async{
  var dbClient = await db;
  dbClient.close();
}



}

