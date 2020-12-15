// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$TodoStore on _TodoStore, Store {
  final _$todosAtom = Atom(name: '_TodoStore.todos');

  @override
  List<Todo> get todos {
    _$todosAtom.reportRead();
    return super.todos;
  }

  @override
  set todos(List<Todo> value) {
    _$todosAtom.reportWrite(value, super.todos, () {
      super.todos = value;
    });
  }

  final _$todosCategoriesAtom = Atom(name: '_TodoStore.todosCategories');

  @override
  List<Category> get todosCategories {
    _$todosCategoriesAtom.reportRead();
    return super.todosCategories;
  }

  @override
  set todosCategories(List<Category> value) {
    _$todosCategoriesAtom.reportWrite(value, super.todosCategories, () {
      super.todosCategories = value;
    });
  }

  final _$getTodosAsyncAction = AsyncAction('_TodoStore.getTodos');

  @override
  Future getTodos() {
    return _$getTodosAsyncAction.run(() => super.getTodos());
  }

  @override
  String toString() {
    return '''
todos: ${todos},
todosCategories: ${todosCategories}
    ''';
  }
}
