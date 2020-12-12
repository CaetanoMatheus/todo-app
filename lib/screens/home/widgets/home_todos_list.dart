import 'package:flutter/material.dart';

import 'package:todo_app/widgets/card/t_todo_card.dart';
import 'package:todo_app/widgets/text/t_text_separator.dart';

import 'package:todo_app/helpers/todo_helper.dart';
import 'package:todo_app/models/todo.dart';
import 'package:todo_app/util/constants.dart';

class HomeTodosList extends StatefulWidget {
  final List<Todo> todos;

  const HomeTodosList({Key key, this.todos}) : super(key: key);

  @override
  _HomeTodosListState createState() => _HomeTodosListState();
}

class _HomeTodosListState extends State<HomeTodosList> {
  final String _title = 'TASKS';
  final TodoHelper _todoHelper = TodoHelper();

  void _handleCheckTodo(bool value, Todo todo) {
    setState(() {
      todo.done = value;
    });
    this._todoHelper.update(todo);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            vertical: padding2,
            horizontal: padding1,
          ),
          child: TTextSeparator(title: this._title, spacedLetters: true),
        ),
        Column(
          children: List.from(
            this.widget.todos.map((Todo todo) => this._buildTodoItem(todo)),
          ),
        ),
      ],
    );
  }

  Dismissible _buildTodoItem(Todo todo) {
    return Dismissible(
      key: Key(todo.id.toString()),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: padding2, vertical: padding3),
        child: TTodoCard(
          todo: todo,
          onChange: (bool value) => this._handleCheckTodo(value, todo),
        ),
      ),
    );
  }
}
