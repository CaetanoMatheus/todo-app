import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'package:todo_app/models/todo.dart';
import 'package:todo_app/stores/todo/todo_store.dart';
import 'package:todo_app/util/constants.dart';
import 'package:todo_app/widgets/card/t_todo_card.dart';
import 'package:todo_app/widgets/text/t_text_separator.dart';

class TodosSection extends StatelessWidget {
  final TodoStore todoStore;
  final String _title = 'TODAY\'S TASKS';

  const TodosSection({Key key, this.todoStore}) : super(key: key);

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
        Observer(
          builder: (BuildContext context) => Column(
            children: List.from(this.todoStore.todos.map(
                  (Todo todo) => this._buildTodoItem(todo),
                )),
          ),
        ),
      ],
    );
  }

  Widget _buildTodoItem(Todo todo) {
    return Dismissible(
      key: Key(todo.id.toString()),
      onDismissed: (_) => this.todoStore.destroy(todo),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: padding1 - 5,
          vertical: padding3,
        ),
        child: TTodoCard(
          todo: todo,
          onChange: (_) => this.todoStore.toggleCheck(todo),
        ),
      ),
    );
  }
}
