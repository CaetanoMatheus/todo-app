import 'package:flutter/material.dart';

import 'package:todo_app/models/todo.dart';

class TTodoCard extends StatelessWidget {
  final Todo todo;
  final Function onChange;

  const TTodoCard({Key key, this.todo, this.onChange}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Checkbox(value: this.todo.done, onChanged: onChange),
          Text(this.todo.title)
        ],
      ),
    );
  }
}
