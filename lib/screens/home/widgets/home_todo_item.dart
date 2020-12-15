import 'package:flutter/material.dart';
import 'package:todo_app/models/todo.dart';
import 'package:todo_app/util/constants.dart';
import 'package:todo_app/widgets/card/t_todo_card.dart';

class HomeTodoItem extends StatelessWidget {
  final Todo todo;

  const HomeTodoItem({Key key, this.todo}) : super(key: key);

  // void _handleCheckTodo(bool value, Todo todo) {
  //   setState(() {
  //     todo.done = value;
  //   });
  //   this._todoHelper.update(todo);
  // }

  // _handleDestroyTodo(Todo todo) => this._todoHelper.destroy(todo.id);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(todo.id.toString()),
      onDismissed: (direction) => () {},
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: padding1 - 5,
          vertical: padding3,
        ),
        child: TTodoCard(todo: todo, onChange: (bool value) => () {}),
      ),
    );
  }
}
