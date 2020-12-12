import 'package:todo_app/helpers/category_helper.dart';

class Category {
  int _id;
  int _color;
  String _name;

  Category();

  Category.fill(String name, int color, [int id]) {
    this.id = id;
    this.name = name;
    this.color = color;
  }

  Category.fromMap(Map<String, dynamic> category) {
    this.id = category[columnId];
    this.name = category[columnName];
    this.color = category[columnColor];
  }

  Map<String, dynamic> toMap() {
    return {
      columnId: this.id,
      columnName: this.name,
      columnColor: this.color,
    };
  }

  @override
  String toString() {
    return '(Id: ${this.id}, Name: ${this.name}, Color: ${this.color})';
  }

  int get id => this._id;

  set id(int id) => this._id = id;

  String get name => this._name;

  set name(String name) => this._name = name;

  int get color => this._color;

  set color(int color) => this._color = color;
}
