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
