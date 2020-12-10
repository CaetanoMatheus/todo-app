import 'package:sqflite/sqflite.dart';

import 'package:todo_app/helpers/database_helper.dart';
import 'package:todo_app/models/category.dart';

final String tableName = 'categories';
final String columnId = 'id';
final String columnName = 'name';
final String columnColor = 'color';

class CategoryHelper {
  DatabaseHelper databaseHelper = DatabaseHelper.getInstance();

  static String getCreateTableSql() {
    return '''
      CREATE TABLE $tableName (
        $columnId INTEGER PRIMARY KEY AUTOINCREMENT,
        $columnName TEXT,
        $columnColor INTEGER
      );
    ''';
  }

  Future<List<Category>> all() async {
    Database database = await databaseHelper.database;
    List categories = await database.query(tableName);
    List<Category> result = [];
    categories.forEach((category) => result.add(Category.fromMap(category)));
    return result;
  }

  Future<Category> create(Category category) async {
    Database database = await databaseHelper.database;
    category.id = await database.insert(tableName, category.toMap());
    return category;
  }
}
