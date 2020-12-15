import 'package:flutter/material.dart';
import 'package:todo_app/stores/todo/todo_store.dart';

import 'package:todo_app/widgets/card/t_basic_card.dart';

import 'package:todo_app/models/category.dart';
import 'package:todo_app/models/todo.dart';
import 'package:todo_app/util/constants.dart';

class TCategoriesList extends StatelessWidget {
  final TodoStore todoStore = TodoStore();

  calculateRemainingTasks(Category category) {
    int counter = 0;
    this.todoStore.todos.forEach((Todo todo) {
      if (category.id == todo.categoryId) counter++;
    });
    return counter;
  }

  List<Widget> _renderCategoriesList() {
    return List.from(
      this.todoStore.todosCategories.map(
            (Category category) => this._buildCategoryItem(category),
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: padding1),
        child: Row(
          children: this._renderCategoriesList(),
        ),
      ),
    );
  }

  Widget _buildCategoryItem(Category category) {
    int remainingTodos = this.calculateRemainingTasks(category);

    return Padding(
      padding: EdgeInsets.only(left: padding1 - 5),
      child: TBasicCard(
        smallText: '$remainingTodos tasks',
        title: category.name,
        color: Color(category.color),
      ),
    );
  }
}
