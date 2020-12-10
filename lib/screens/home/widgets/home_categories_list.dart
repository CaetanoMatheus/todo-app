import 'package:flutter/material.dart';
import 'package:todo_app/models/todo.dart';

import 'package:todo_app/widgets/card/t_basic_card.dart';
import 'package:todo_app/widgets/text/t_text_separator.dart';

import 'package:todo_app/models/category.dart';

class HomeCategoriesList extends StatefulWidget {
  final List<Category> categories;
  final List<Todo> todos;

  const HomeCategoriesList({
    Key key,
    this.categories,
    this.todos,
  }) : super(key: key);

  @override
  _HomeCategoriesListState createState() => _HomeCategoriesListState();
}

class _HomeCategoriesListState extends State<HomeCategoriesList> {
  final String title = 'CATEGORIES';

  calculateRemainingTasks(Category category) {
    int counter = 0;
    this.widget.todos.forEach((todo) {
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
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: TTextSeparator(title: this.title),
        ),
        Container(
          height: 130,
          padding: EdgeInsets.symmetric(vertical: 20),
          child: ListView.builder(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: this.widget.categories.length,
            itemBuilder: (context, index) => buildCategoryItem(index),
          ),
        ),
      ],
    );
  }

  Padding buildCategoryItem(int index) {
    double rightPadding = (index == this.widget.categories.length - 1) ? 10 : 0;
    Category category = this.widget.categories[index];
    int remainingTodos = this.calculateRemainingTasks(category);

    return Padding(
      padding: EdgeInsets.only(left: 10, right: rightPadding),
      child: TBasicCard(
        smallText: '$remainingTodos tasks',
        title: category.name,
        color: Color(category.color),
      ),
    );
  }
}
