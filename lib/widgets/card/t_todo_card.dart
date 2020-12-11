import 'package:flutter/material.dart';

import 'package:todo_app/models/todo.dart';

class TTodoCard extends StatelessWidget {
  final Todo todo;
  final Function onChange;

  const TTodoCard({Key key, this.todo, this.onChange}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Checkbox(value: this.todo.done, onChanged: onChange),
          Flexible(
            child: Text(
              this.todo.title,
              style: TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
