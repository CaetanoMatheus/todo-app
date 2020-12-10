import 'package:flutter/material.dart';
import 'package:todo_app/screens/home/widgets/home_categories_list.dart';
import 'package:todo_app/screens/home/widgets/home_greetings.dart';
import 'package:todo_app/screens/home/widgets/home_todos_list.dart';

import 'package:todo_app/widgets/card/t_basic_card.dart';
import 'package:todo_app/widgets/card/t_todo_card.dart';
import 'package:todo_app/widgets/text/t_text_separator.dart';

import 'package:todo_app/models/todo.dart';
import 'package:todo_app/models/category.dart';
import 'package:todo_app/helpers/category_helper.dart';
import 'package:todo_app/helpers/todo_helper.dart';

import 'package:todo_app/database_redefinition.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Category> categories = [];
  List<Todo> todos = [];

  getCategories() async {
    CategoryHelper categoryHelper = CategoryHelper();
    List<Category> categories = await categoryHelper.all();
    setState(() {
      this.categories = categories;
    });
  }

  getTodos() async {
    TodoHelper todoHelper = TodoHelper();
    List<Todo> todos = await todoHelper.all();
    setState(() {
      this.todos = todos;
    });
  }

  @override
  void initState() {
    super.initState();
    // buildDatabaseStuff().then((_) {
    getCategories();
    getTodos();
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEFEFFF),
      appBar: buildAppBar(),
      drawer: buildDrawer(),
      floatingActionButton: buildFloatingActionButton(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HomeGreetings('What\'s up, Matheus!'),
          HomeCategoriesList(categories: this.categories),
          HomeTodosList(todos: this.todos),
        ],
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Color(0xffEFEFFF),
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.grey[600]),
      actions: [
        IconButton(icon: Icon(Icons.search), onPressed: null),
        IconButton(icon: Icon(Icons.notifications_outlined), onPressed: null),
      ],
    );
  }

  Drawer buildDrawer() => Drawer();

  FloatingActionButton buildFloatingActionButton() {
    return FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: () {},
    );
  }
}
