import 'package:flutter/material.dart';

import 'package:todo_app/widgets/checkbox/t_checkbox.dart';

import 'package:todo_app/models/todo.dart';
import 'package:todo_app/util/constants.dart';

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
        borderRadius: borderRadius,
      ),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.all(padding2),
            child: TCheckbox(
              isChecked: this.todo.done,
              borderColor: Colors.pink,
              onTap: onChange,
            ),
          ),
          Flexible(
            child: Text(
              this.todo.title,
              style: TextStyle(
                fontSize: 17,
                fontWeight: fontWeight,
                color: textPrimaryColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
