import 'package:flutter/material.dart';

import 'package:todo_app/widgets/card/t_basic_card.dart';
import 'package:todo_app/widgets/text/t_text_separator.dart';

import 'package:todo_app/models/category.dart';

class HomeCategoriesList extends StatelessWidget {
  final List<Category> categories;
  final String title = 'CATEGORIES';

  const HomeCategoriesList({Key key, this.categories}) : super(key: key);

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
            itemCount: this.categories.length,
            itemBuilder: (context, index) => buildCategoryItem(index),
          ),
        ),
      ],
    );
  }

  Padding buildCategoryItem(int index) {
    double rightPadding = (index == this.categories.length - 1) ? 10 : 0;
    return Padding(
      padding: EdgeInsets.only(left: 10, right: rightPadding),
      child: TBasicCard(
        smallText: '40 taks',
        title: this.categories[index].name,
        color: Color(this.categories[index].color),
      ),
    );
  }
}
