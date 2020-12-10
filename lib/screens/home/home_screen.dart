import 'package:flutter/material.dart';
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
  testDatabase() async {
    CategoryHelper categoryHelper = CategoryHelper();
    print(await categoryHelper.all());
  }

  @override
  void initState() {
    super.initState();
    testDatabase();
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
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            physics: BouncingScrollPhysics(),
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                children: [
                  TBasicCard(
                    smallText: '40 Tasks',
                    title: 'Business',
                    color: Colors.red,
                  ),
                  SizedBox(width: 10),
                  TBasicCard(
                    smallText: '12 Tasks',
                    title: 'Personal',
                    color: Colors.blue,
                  ),
                  SizedBox(width: 10),
                  TBasicCard(
                    smallText: '12 Tasks',
                    title: 'Personal',
                    color: Colors.purple,
                  ),
                  SizedBox(width: 10),
                  TBasicCard(
                    smallText: '12 Tasks',
                    title: 'Personal',
                    color: Colors.green,
                  ),
                  SizedBox(width: 10),
                  TBasicCard(
                    smallText: '12 Tasks',
                    title: 'Personal',
                    color: Colors.indigo,
                  ),
                ],
              ),
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
