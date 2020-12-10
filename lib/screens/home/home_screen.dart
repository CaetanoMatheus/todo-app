import 'package:flutter/material.dart';
import 'package:todo_app/helpers/database_helper.dart';
import 'package:todo_app/models/category.dart';

import 'package:todo_app/widgets/card/t_basic_card.dart';
import 'package:todo_app/widgets/card/t_todo_card.dart';
import 'package:todo_app/widgets/text/t_text_separator.dart';
import 'package:todo_app/widgets/text/t_title.dart';

import 'package:todo_app/models/todo.dart';
import 'package:todo_app/helpers/category_helper.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Category> categories = [];

  test() async {
    DatabaseHelper helper = DatabaseHelper.getInstance();
    await helper.destroyDabase();
  }

  getCategories() async {
    CategoryHelper categoryHelper = CategoryHelper();
    // Category category = Category.fill('Study', Colors.orange.value);
    // await categoryHelper.create(category);
    List<Category> categories = await categoryHelper.all();
    setState(() {
      this.categories = categories;
    });
  }

  @override
  void initState() {
    super.initState();
    // test();
    getCategories();
    int color = Colors.red.value;
    print(color);
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
          Padding(
            padding: EdgeInsets.all(20),
            child: TTitle(title: 'What\'s up, Matheus!'),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: TTextSeparator(title: 'CATEGORIES'),
          ),
          Container(
            height: 130,
            padding: EdgeInsets.symmetric(vertical: 20),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: this.categories.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(
                    left: 10,
                    right: (index == categories.length - 1) ? 10 : 0,
                  ),
                  child: TBasicCard(
                    smallText: '40 taks',
                    title: categories[index].name,
                    color: Color(categories[index].color),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: TTextSeparator(title: 'TASKS'),
          ),
          Expanded(
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: todos.length,
              itemBuilder: (context, index) => TTodoCard(
                todo: todos[index],
                onChange: (bool value) {},
              ),
            ),
          ),
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
