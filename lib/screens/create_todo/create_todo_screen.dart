import 'package:flutter/material.dart';

import 'package:todo_app/widgets/button/t_close_button.dart';
import 'package:todo_app/models/category.dart';

import 'package:todo_app/util/constants.dart';
import 'package:todo_app/widgets/input/t_input.dart';

class CreateTodoScreen extends StatelessWidget {
  final List<Category> categories;

  const CreateTodoScreen({Key key, this.categories}) : super(key: key);

  void _navigateBack(BuildContext context) => Navigator.pop(context);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                top: MediaQuery.of(context).size.height * .1,
                right: padding,
                left: padding,
              ),
              child: TInput(label: 'Enter a new task'),
            ),
            Text(this.categories[0].toString()),
          ],
        ),
      ),
    );
  }
}
