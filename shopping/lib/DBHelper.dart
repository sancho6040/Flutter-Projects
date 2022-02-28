import 'package:path/path.dart';
import 'package:shopping/models/list_item.dart';
import 'package:shopping/models/shopping_list.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  final int version = 1;
  Database? db;

  Future openDB() async {
    db ??= await openDatabase(join(await getDatabasesPath(), "shopping.db"),
        onCreate: (database, version) {
      database.execute(
          "CREATE TABLE lists(id INTEGER PRIMARY KEY, name TEXT, priorty INTEGER)"); // mayusculas es sql
      database.execute(
          "CREATE TABLE items(id INTEGER PRIMARY KEY, idList INTEGER name TEXT, quantity TEXT, note TEXT, FOREUGN KEY(idList) REFERENCES list(id))");
    }, version: version);
  }

  Future textDb() async {
    await openDB();
    await db?.execute('INSERT INTO lists VALUES( 0, "Fruit", 2)');
    await db?.execute(
        'INSERT INTO lists VALUES( 0, 0, "Apples", 2, "Comprar frescas)');

    List? lists = await db?.rawQuery("SELECT * FROM lists");
    List? items = await db?.rawQuery("SELECT * FROM items");

    print(lists![0].toString());
    print(items![0].toString());
  }

  Future insertList(ShoppingList list) async {
    int? id = await db?.insert("Lists", list.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);

    return id!;
  }

  Future insertItem(ListItem item) async {
    int? id = await db?.insert("items", item.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);

    return id!;
  }

  Future<List<ShoppingList>> getLists() async {
    List<Map<String, dynamic>>? maps = await db?.query("Lists");

    return List.generate(
        maps!.length,
        (i) =>
            ShoppingList(maps[i]['id'], maps[i]['name'], maps[i]['priority']));
  }
}
