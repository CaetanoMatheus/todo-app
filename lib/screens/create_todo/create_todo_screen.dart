import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:todo_app/models/todo.dart';
import 'package:todo_app/stores/category/category_store.dart';
import 'package:todo_app/stores/todo/todo_store.dart';
import 'package:todo_app/util/constants.dart';

import 'package:todo_app/widgets/button/t_close_button.dart';
import 'package:todo_app/models/category.dart';

import 'package:todo_app/util/constants.dart';
import 'package:todo_app/widgets/card/t_basic_card.dart';
import 'package:todo_app/widgets/input/t_input.dart';

class CreateTodoScreen extends StatefulWidget {
  @override
  _CreateTodoScreenState createState() => _CreateTodoScreenState();
}

class _CreateTodoScreenState extends State<CreateTodoScreen> {
  final CategoryStore _categoryStore = CategoryStore();
  final TodoStore _todoStore = TodoStore();
  final Todo _todo = Todo.fill(null, false, 1);

  void _navigateBack(BuildContext context) => Navigator.pop(context);

  @override
  void initState() {
    super.initState();
    this._categoryStore.getAll();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                Spacer(),
                Padding(
                  padding: EdgeInsets.all(20),
                  child: TCloseButton(onTap: this._navigateBack),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * .2,
                right: padding,
                left: padding,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TInput(label: 'Enter a new task'),
                ],
              ),
            ),
            SizedBox(height: 30),
            SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: padding1),
                child: Observer(
                  builder: (BuildContext context) => Row(
                    children: List.from(this._categoryStore.categories.map(
                          (Category category) =>
                              this._buildCategoryItem(category),
                        )),
                  ),
                ),
              ),
            ),
            Spacer(),
            Container(
              width: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                boxShadow: [
                  BoxShadow(
                    color: accentColor.withOpacity(.8),
                    offset: Offset(0, 3),
                    blurRadius: 10,
                  )
                ],
              ),
              child: RaisedButton(
                color: accentColor,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                onPressed: () {},
                child: Padding(
                  padding: EdgeInsets.all(15),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'New Task',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(width: 10),
                      Icon(Icons.add, color: Colors.white),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 50),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryItem(Category category) {
    return GestureDetector(
      onTap: () {
        setState(() {
          this._todo.categoryId = category.id;
        });
      },
      child: Padding(
        padding: EdgeInsets.only(left: padding1 - 5),
        child: AnimatedContainer(
          duration: Duration(milliseconds: 300),
          padding: EdgeInsets.all(4),
          decoration: BoxDecoration(
              borderRadius: borderRadius,
              color: this._todo.categoryId == category.id
                  ? Color(category.color)
                  : textSecondaryColor,
              boxShadow: [
                BoxShadow(
                  color: this._todo.categoryId == category.id
                      ? Color(category.color).withOpacity(.6)
                      : backgroundColor,
                  offset: Offset(0, 3),
                  blurRadius: 8,
                )
              ]),
          child: TBasicCard(
            title: category.name,
            color: Color(category.color),
          ),
        ),
      ),
    );
  }
}
