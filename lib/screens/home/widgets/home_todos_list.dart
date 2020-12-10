import 'package:flutter/material.dart';
import 'package:todo_app/models/todo.dart';

import 'package:todo_app/widgets/card/t_todo_card.dart';
import 'package:todo_app/widgets/text/t_text_separator.dart';

class HomeTodosList extends StatelessWidget {
  final List<Todo> todos;
  final String title = 'TASKS';

  const HomeTodosList({Key key, this.todos}) : super(key: key);

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
              itemCount: this.todos.length,
              itemBuilder: (context, index) => buildTodoItem(index),
            ),
          ),
        ],
      ),
    );
  }

  TTodoCard buildTodoItem(int index) {
    return TTodoCard(
      todo: this.todos[index],
      onChange: (bool value) {},
    );
  }
}
