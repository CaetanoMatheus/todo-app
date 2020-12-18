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

  final _$getAllAsyncAction = AsyncAction('_TodoStore.getAll');

  @override
  Future<void> getAll() {
    return _$getAllAsyncAction.run(() => super.getAll());
  }

  final _$toggleCheckAsyncAction = AsyncAction('_TodoStore.toggleCheck');

  @override
  Future<void> toggleCheck(Todo todo) {
    return _$toggleCheckAsyncAction.run(() => super.toggleCheck(todo));
  }

  final _$createAsyncAction = AsyncAction('_TodoStore.create');

  @override
  Future<Todo> create(Todo todo) {
    return _$createAsyncAction.run(() => super.create(todo));
  }

  final _$destroyAsyncAction = AsyncAction('_TodoStore.destroy');

  @override
  Future<void> destroy(Todo todo) {
    return _$destroyAsyncAction.run(() => super.destroy(todo));
  }

  @override
  String toString() {
    return '''
todos: ${todos}
    ''';
  }
}
