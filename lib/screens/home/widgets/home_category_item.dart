import 'package:flutter/material.dart';
import 'package:todo_app/models/category.dart';
import 'package:todo_app/models/todo.dart';

import 'package:todo_app/stores/todo/todo_store.dart';
import 'package:todo_app/util/constants.dart';
import 'package:todo_app/widgets/card/t_basic_card.dart';

class HomeCategoryItem extends StatelessWidget {
  final TodoStore todoStore;
  final Category category;

  const HomeCategoryItem({
    Key key,
    this.todoStore,
    this.category,
  }) : super(key: key);

  _calculateRemainingTasks() {
    int counter = 0;
    this.todoStore.todos.forEach((Todo todo) {
      if (this.category.id == todo.categoryId) counter++;
    });
    return counter;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: padding1 - 5),
      child: TBasicCard(
        smallText: '${this._calculateRemainingTasks()} tasks',
        title: category.name,
        color: Color(category.color),
      ),
    );
  }
}
