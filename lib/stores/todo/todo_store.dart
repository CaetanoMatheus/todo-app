import 'package:mobx/mobx.dart';
import 'package:todo_app/helpers/category_helper.dart';

import 'package:todo_app/helpers/todo_helper.dart';
import 'package:todo_app/models/category.dart';
import 'package:todo_app/models/todo.dart';

part 'todo_store.g.dart';

class TodoStore = _TodoStore with _$TodoStore;

abstract class _TodoStore with Store {
  TodoHelper _todoHelper = TodoHelper();
  CategoryHelper _categoryHelper = CategoryHelper();

  @observable
  List<Todo> todos = [];

  @observable
  List<Category> todosCategories = [];

  @action
  getTodos() async => this.todos = await this._todoHelper.all();

  @action
  getCategories() async {
    this.todosCategories = await this._categoryHelper.all();
  }

  @action
  void toggleTodoCheck(Todo todo) async {
    todo.done = !todo.done;
    await this._todoHelper.update(todo);
    this.getTodos();
  }

  @action
  void destroy(Todo todo) async {
    await this._todoHelper.destroy(todo.id);
    this.getTodos();
  }
}
