import 'package:flutter/material.dart';
import 'package:todo_app/models/todo.dart';
import 'package:todo_app/router/app_router.dart';
import 'package:todo_app/screens/create_todo/sections/categories_section.dart';
import 'package:todo_app/stores/category/category_store.dart';
import 'package:todo_app/stores/todo/todo_store.dart';
import 'package:todo_app/util/constants.dart';

import 'package:todo_app/widgets/button/t_close_button.dart';

import 'package:todo_app/widgets/button/t_glow_button.dart';
import 'package:todo_app/widgets/input/t_input.dart';

class CreateTodoScreen extends StatefulWidget {
  @override
  _CreateTodoScreenState createState() => _CreateTodoScreenState();
}

class _CreateTodoScreenState extends State<CreateTodoScreen> {
  final CategoryStore _categoryStore = CategoryStore();
  final TodoStore _todoStore = TodoStore();
  final Todo _todo = Todo.fill(null, false, 1);
  final TextEditingController _textController = TextEditingController();

  @override
  void initState() {
    super.initState();
    this._categoryStore.getAll();
  }

  void _navigateBack(BuildContext context) => Navigator.pop(context);

  void _navigateToInitialScreen(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(
      context,
      AppRouter.initialRoute,
      (_) => false,
    );
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
                  TInput(
                    label: 'Enter a new task',
                    controller: this._textController,
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),
            CategoriesSection(
              categoryStore: this._categoryStore,
              todo: this._todo,
            ),
            Spacer(),
            TGlowButton(
              'New Task',
              icon: Icons.add,
              color: accentColor,
              onTap: () {
                if (this._textController.text.length < 1) return;
                this._todo.title = this._textController.text;
                this._todoStore.create(this._todo);
                this._navigateToInitialScreen(context);
              },
            ),
            SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
