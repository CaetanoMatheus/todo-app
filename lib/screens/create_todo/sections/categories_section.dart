import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'package:todo_app/models/category.dart';
import 'package:todo_app/models/todo.dart';
import 'package:todo_app/stores/category/category_store.dart';
import 'package:todo_app/util/constants.dart';
import 'package:todo_app/widgets/card/t_basic_card.dart';

class CategoriesSection extends StatefulWidget {
  final CategoryStore categoryStore;
  final Todo todo;

  const CategoriesSection({
    Key key,
    this.categoryStore,
    this.todo,
  }) : super(key: key);

  @override
  _CategoriesSectionState createState() => _CategoriesSectionState();
}

class _CategoriesSectionState extends State<CategoriesSection> {
  void _changeTodoCategory(Category category) {
    setState(() {
      this.widget.todo.categoryId = category.id;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: padding1),
        child: Observer(
          builder: (BuildContext context) => Row(
            children: List.from(this.widget.categoryStore.categories.map(
                  (Category category) => this._buildCategoryItem(category),
                )),
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryItem(Category category) {
    return GestureDetector(
      onTap: () => this._changeTodoCategory(category),
      child: Padding(
        padding: EdgeInsets.only(left: padding1 - 5),
        child: AnimatedContainer(
          duration: Duration(milliseconds: 300),
          padding: EdgeInsets.all(4),
          decoration: BoxDecoration(
            borderRadius: borderRadius,
            color: this.widget.todo.categoryId == category.id
                ? Color(category.color)
                : textSecondaryColor,
            boxShadow: [
              BoxShadow(
                color: this.widget.todo.categoryId == category.id
                    ? Color(category.color).withOpacity(.6)
                    : backgroundColor,
                offset: Offset(0, 3),
                blurRadius: 8,
              )
            ],
          ),
          child: TBasicCard(title: category.name, color: Color(category.color)),
        ),
      ),
    );
  }
}
