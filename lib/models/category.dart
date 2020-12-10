import 'package:todo_app/helpers/category_helper.dart';

class Category {
  int _id;
  String _name;

  Category();

  Category.fill(String name, [int id]) {
    this.id = id;
    this.name = name;
  }

  Category.fromMap(Map<String, dynamic> category) {
    this.id = category[columnId];
    this.name = category[columnName];
  }

  Map<String, dynamic> toMap() => {columnId: this.id, columnName: this.name};

  @override
  String toString() => '(Id: ${this.id}, Name: ${this.name}';

  int get id => this._id;

  set id(int id) => this._id = id;

  String get name => this._name;

  set name(String name) => this._name = name;
}
