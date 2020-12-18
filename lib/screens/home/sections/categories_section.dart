import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'package:todo_app/models/category.dart';
import 'package:todo_app/models/todo.dart';
import 'package:todo_app/stores/category/category_store.dart';
import 'package:todo_app/stores/todo/todo_store.dart';
import 'package:todo_app/util/constants.dart';
import 'package:todo_app/widgets/card/t_basic_card.dart';
import 'package:todo_app/widgets/text/t_text_separator.dart';

class CategoriesSection extends StatelessWidget {
  final CategoryStore categoryStore;
  final TodoStore todoStore;
  final String title = 'CATEGORIES';

  const CategoriesSection({
    Key key,
    this.categoryStore,
    this.todoStore,
  }) : super(key: key);

  int _calculateRemainingTasks(Category category) {
    int counter = 0;
    this.todoStore.todos.forEach((Todo todo) {
      if (category.id == todo.categoryId) counter++;
    });
    return counter;
  }

  String _getCategorySmallText(Category category) {
    int remainingTasks = this._calculateRemainingTasks(category);
    return '$remainingTasks tasks';
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: padding),
          child: TTextSeparator(title: this.title, spacedLetters: true),
        ),
        Hero(
          tag: 'CategoriesList',
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: padding1),
              child: Observer(
                builder: (BuildContext context) => Row(
                  children: List.from(this.categoryStore.categories.map(
                        (Category category) =>
                            this._buildCategoryItem(category),
                      )),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCategoryItem(Category category) {
    return Padding(
      padding: EdgeInsets.only(left: padding1 - 5),
      child: TBasicCard(
        smallText: this._getCategorySmallText(category),
        title: category.name,
        color: Color(category.color),
      ),
    );
  }
}
