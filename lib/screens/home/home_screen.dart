import 'package:flutter/material.dart';

import 'package:todo_app/screens/create_todo/create_todo_screen.dart';
import 'package:todo_app/screens/home/sections/categories_section.dart';
import 'package:todo_app/screens/home/sections/todos_section.dart';
import 'package:todo_app/screens/home/widgets/home_container.dart';
import 'package:todo_app/stores/category/category_store.dart';
import 'package:todo_app/stores/todo/todo_store.dart';
import 'package:todo_app/util/constants.dart';
import 'package:todo_app/widgets/text/t_title.dart';

import 'package:todo_app/database_redefinition.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TodoStore _todoStore = TodoStore();
  final CategoryStore _categoryStore = CategoryStore();

  @override
  void initState() {
    super.initState();
    // buildDatabaseStuff().then((_) {
    this._categoryStore.getAll();
    this._todoStore.getAll();
    // });
  }

  String _getGreetingMessage() => 'What\'s up, Matheus!';

  @override
  Widget build(BuildContext context) {
    return HomeContainer(pageContent: [
      Container(
        padding: EdgeInsets.symmetric(
          vertical: padding1,
          horizontal: padding,
        ),
        child: TTitle(title: this._getGreetingMessage()),
      ),
      CategoriesSection(
        categoryStore: this._categoryStore,
        todoStore: this._todoStore,
      ),
      TodosSection(todoStore: this._todoStore),
    ]);
  }
}
