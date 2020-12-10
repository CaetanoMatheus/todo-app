import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:todo_app/helpers/category_helper.dart';
import 'package:todo_app/helpers/todo_helper.dart';

class DatabaseHelper {
  Database _database;

  final String _databaseName = 'todo_app.db';
  final int _databaseVersion = 1;

  static DatabaseHelper _instance;

  DatabaseHelper._();

  static DatabaseHelper getInstance() {
    if (_instance == null) _instance = new DatabaseHelper._();
    return _instance;
  }

  Future<String> _getDatabasePath() async {
    String databasesPath = await getDatabasesPath();
    return join(databasesPath, this._databaseName);
  }

  Future<Database> _initDatabase() async {
    String databasePath = await this._getDatabasePath();
    return await openDatabase(
      databasePath,
      version: this._databaseVersion,
      onCreate: this._onDatabaseCreate,
    );
  }

  void _onDatabaseCreate(Database database, int newerVersion) async {
    await database.execute(CategoryHelper.getCreateTableSql());
    await database.execute(TodoHelper.getCreateTableSql());
  }

  Future destroyDabase() async {
    await deleteDatabase(await this._getDatabasePath());
  }

  Future<Database> get database async {
    if (this._database == null) this._database = await this._initDatabase();
    return this._database;
  }
}
