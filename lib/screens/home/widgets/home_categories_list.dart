import 'package:flutter/material.dart';

import 'package:todo_app/widgets/card/t_basic_card.dart';
import 'package:todo_app/widgets/text/t_text_separator.dart';

import 'package:todo_app/models/category.dart';
import 'package:todo_app/models/todo.dart';
import 'package:todo_app/util/constants.dart';

class HomeCategoriesList extends StatelessWidget {
  final List<Category> categories;
  final List<Todo> todos;
  final String _title = 'CATEGORIES';

  const HomeCategoriesList({Key key, this.categories, this.todos})
      : super(key: key);

  calculateRemainingTasks(Category category) {
    int counter = 0;
    this.todos.forEach((Todo todo) {
      if (category.id == todo.categoryId) counter++;
    });
    return counter;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: padding),
          child: TTextSeparator(title: this._title, spacedLetters: true),
        ),
        SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: padding1),
            child: Row(
              children: List.from(
                this.categories.map(
                      (Category category) => this._buildCategoryItem(category),
                    ),
              ),
            ),
          ),
        )
      ],
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
