import 'package:mobx/mobx.dart';

import 'package:todo_app/helpers/todo_helper.dart';
import 'package:todo_app/models/todo.dart';

part 'todo_store.g.dart';

class TodoStore = _TodoStore with _$TodoStore;

abstract class _TodoStore with Store {
  TodoHelper _todoHelper = TodoHelper();

  @observable
  List<Todo> todos = [];

  @action
  Future<void> getAll() async => this.todos = await this._todoHelper.all();

  @action
  Future<void> toggleCheck(Todo todo) async {
    todo.done = !todo.done;
    await this._todoHelper.update(todo);
    this.getAll();
  }

  @action
  Future<Todo> create(Todo todo) async {
    Todo newTodo = await this._todoHelper.create(todo);
    this.getAll();
    return newTodo;
  }

  @action
  Future<void> destroy(Todo todo) async {
    await this._todoHelper.destroy(todo.id);
    this.getAll();
  }
}
