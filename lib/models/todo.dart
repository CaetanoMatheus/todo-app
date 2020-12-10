class Todo {
  int _id;
  String _title;
  bool _done;

  Todo();

  Todo.fill(String title, bool done, [int id]) {
    this.id = id;
    this.title = title;
    this.done = done;
  }

  @override
  String toString() {
    return '(Id: ${this.id}, Title: ${this.title}, Done: ${this.done})';
  }

  int get id => this._id;

  set id(int id) => this._id = id;

  String get title => this._title;

  set title(String title) => this._title = title;

  bool get done => this._done;

  set done(bool done) => this._done;
}
