import 'package:todo_app/helpers/todo_helper.dart';

class Todo {
  int _id;
  int _categoryId;
  String _title;
  bool _done;

  Todo();

  Todo.fill(String title, bool done, int categoryId, [int id]) {
    this.id = id;
    this.title = title;
    this.done = done;
    this.categoryId = categoryId;
  }

  Todo.fromMap(Map<String, dynamic> category) {
    this.id = category[columnId];
    this.title = category[columnTitle];
    this.done = category[columnDone];
    this.categoryId = category[columnCategoryId];
  }

  Map<String, dynamic> toMap() {
    return {
      columnId: this.id,
      columnTitle: this.title,
      columnDone: this.done,
      columnCategoryId: this.categoryId,
    };
  }

  @override
  String toString() {
    return '(Id: ${this.id}, Title: ${this.title}, Done: ${this.done}, CategoryId: ${this.categoryId})';
  }

  int get id => this._id;

  set id(int id) => this._id = id;

  String get title => this._title;

  set title(String title) => this._title = title;

  bool get done => this._done;

  set done(bool done) => this._done = done;

  int get categoryId => this._categoryId;

  set categoryId(int categoryId) => this._categoryId = categoryId;
}

List<Todo> todos = [
  Todo.fill('Go shopping', false, 1),
  Todo.fill('Wash the Car', true, 2),
  Todo.fill('Clean the house', true, 3),
  Todo.fill('Play with my pets', false, 4),
  Todo.fill('Plant a tree', false, 5),
  Todo.fill('Call my mom', false, 6),
  Todo.fill('Play videogames', true, 7),
  Todo.fill('Sing a son', true, 8),
  Todo.fill('Take a bath', true, 9),
  Todo.fill('Eat something', false, 10),
  Todo.fill('Buy a new cellphone charger', false, 11),
  Todo.fill('Turn off the lights', false, 12),
  Todo.fill('Workout', false, 13),
  Todo.fill('Go to sleep', false, 14),
  Todo.fill('Clean my glasses', false, 15),
];
