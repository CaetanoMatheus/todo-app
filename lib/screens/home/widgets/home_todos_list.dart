import 'package:flutter/material.dart';
import 'package:todo_app/helpers/todo_helper.dart';
import 'package:todo_app/models/todo.dart';

import 'package:todo_app/widgets/card/t_todo_card.dart';
import 'package:todo_app/widgets/text/t_text_separator.dart';

class HomeTodosList extends StatefulWidget {
  final List<Todo> todos;

  const HomeTodosList({Key key, this.todos}) : super(key: key);

  @override
  _HomeTodosListState createState() => _HomeTodosListState();
}

class _HomeTodosListState extends State<HomeTodosList> {
  final String title = 'TASKS';
  final TodoHelper todoHelper = TodoHelper();

  handleCheckTodo(bool value, Todo todo) {
    setState(() {
      todo.done = value;
    });
    this.todoHelper.update(todo);
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: TTextSeparator(title: this.title),
          ),
          Expanded(
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: this.widget.todos.length,
              itemBuilder: (context, index) => buildTodoItem(index),
            ),
          ),
        ],
      ),
    );
  }

  Dismissible buildTodoItem(int index) {
    Todo todo = this.widget.todos[index];

    return Dismissible(
      key: Key(index.toString()),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: TTodoCard(
          todo: todo,
          onChange: (bool value) => this.handleCheckTodo(value, todo),
        ),
      ),
    );
  }
}
