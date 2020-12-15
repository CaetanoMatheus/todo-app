import 'package:flutter/material.dart';

import 'package:todo_app/widgets/card/t_basic_card.dart';

import 'package:todo_app/models/category.dart';
import 'package:todo_app/models/todo.dart';
import 'package:todo_app/stores/todo/todo_store.dart';
import 'package:todo_app/util/constants.dart';

class HomeCategoriesList extends StatelessWidget {
  final TodoStore store;

  const HomeCategoriesList({Key key, this.store}) : super(key: key);

  _calculateRemainingTasks(Category category) {
    int counter = 0;
    this.store.todos.forEach((Todo todo) {
      if (category.id == todo.categoryId) counter++;
    });
    return counter;
  }

  List<Widget> _buildItemsList() {
    return List.from(this.store.todosCategories.map(
          (Category category) => this._buildCategoryItem(category),
        ));
  }

  Widget _buildCategoryItem(Category category) {
    return Padding(
      padding: EdgeInsets.only(left: padding1 - 5),
      child: TBasicCard(
        smallText: '${this._calculateRemainingTasks(category)} tasks',
        title: category.name,
        color: Color(category.color),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(children: this._buildItemsList());
  }
}
