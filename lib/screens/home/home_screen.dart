import 'package:flutter/material.dart';
import 'package:todo_app/screens/create_todo/create_todo_screen.dart';
import 'package:todo_app/screens/home/widgets/home_categories_list.dart';
import 'package:todo_app/screens/home/widgets/home_greetings.dart';
import 'package:todo_app/screens/home/widgets/home_todos_list.dart';

import 'package:todo_app/models/todo.dart';
import 'package:todo_app/models/category.dart';
import 'package:todo_app/helpers/category_helper.dart';
import 'package:todo_app/helpers/todo_helper.dart';
import 'package:todo_app/util/constants.dart';

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

  navigateToCreateTodoScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CreateTodoScreen()),
    );
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
      backgroundColor: backgroundColor,
      appBar: buildAppBar(),
      drawer: buildDrawer(),
      floatingActionButton: buildFloatingActionButton(),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HomeGreetings('What\'s up, Matheus!'),
            HomeCategoriesList(categories: this.categories, todos: this.todos),
            HomeTodosList(todos: this.todos),
          ],
        ),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: backgroundColor,
      elevation: 0,
      iconTheme: IconThemeData(color: textSecondaryColor),
      leading: Builder(
        builder: (BuildContext context) => Padding(
          padding: EdgeInsets.symmetric(horizontal: padding2),
          child: IconButton(
            icon: Icon(Icons.menu, size: 27),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.search, color: textSecondaryColor, size: 27),
          onPressed: () {},
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: padding2),
          child: IconButton(
            icon: Icon(
              Icons.notifications_outlined,
              color: textSecondaryColor,
              size: 27,
            ),
            onPressed: () {},
          ),
        ),
      ],
    );
  }

  Drawer buildDrawer() => Drawer();

  FloatingActionButton buildFloatingActionButton() {
    return FloatingActionButton(
      backgroundColor: Colors.blue[800],
      child: Icon(Icons.add),
      onPressed: navigateToCreateTodoScreen,
    );
  }
}
