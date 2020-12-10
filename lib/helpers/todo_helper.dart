import 'package:sqflite/sqflite.dart';

import 'package:todo_app/helpers/database_helper.dart';
import 'package:todo_app/models/todo.dart';

final String tableName = 'todos';
final String columnId = 'id';
final String columnTitle = 'title';
final String columnDone = 'done';
final String columnCategoryId = 'category_id';

class TodoHelper {
  DatabaseHelper databaseHelper = DatabaseHelper.getInstance();

  static String getCreateTableSql() {
    return '''
      CREATE TABLE $tableName (
        $columnId INTEGER PRIMARY KEY AUTOINCREMENT,
        $columnTitle TEXT,
        $columnDone INTEGER,
        $columnCategoryId INTEGER
      );
    ''';
  }

  Future<List<Todo>> all() async {
    Database database = await databaseHelper.database;
    List todos = await database.query(tableName);
    List<Todo> result = [];
    todos.forEach((todo) {
      Map<String, dynamic> newTodo = Map.from(todo);
      newTodo[columnDone] = newTodo[columnDone] == 1;
      result.add(Todo.fromMap(newTodo));
    });
    return result;
  }

  Future<Todo> create(Todo todo) async {
    Database database = await databaseHelper.database;
    Map mapTodo = todo.toMap();
    mapTodo[columnDone] = mapTodo[columnDone] == true ? 1 : 0;
    todo.id = await database.insert(tableName, mapTodo);
    return todo;
  }

  Future<int> update(Todo todo) async {
    Database database = await databaseHelper.database;
    Map mapTodo = todo.toMap();
    mapTodo[columnDone] = mapTodo[columnDone] == true ? 1 : 0;
    return await database.update(
      tableName,
      mapTodo,
      where: '$columnId = ?',
      whereArgs: [todo.id],
    );
  }
}
