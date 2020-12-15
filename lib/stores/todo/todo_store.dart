import 'package:mobx/mobx.dart';
import 'package:todo_app/helpers/category_helper.dart';

import 'package:todo_app/helpers/todo_helper.dart';
import 'package:todo_app/models/category.dart';
import 'package:todo_app/models/todo.dart';

part 'todo_store.g.dart';

class TodoStore = _TodoStore with _$TodoStore;

abstract class _TodoStore with Store {
  TodoHelper todoHelper = TodoHelper();
  CategoryHelper categoryHelper = CategoryHelper();

  @observable
  List<Todo> todos = [];

  @observable
  List<Category> todosCategories = [];

  @action
  getTodos() async => this.todos = await todoHelper.all();

  getCategories() async => this.todosCategories = await categoryHelper.all();
}
