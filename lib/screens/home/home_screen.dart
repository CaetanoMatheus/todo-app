import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:todo_app/models/category.dart';
import 'package:todo_app/screens/create_todo/create_todo_screen.dart';
import 'package:todo_app/screens/home/widgets/home_categories_list.dart';
import 'package:todo_app/screens/home/widgets/home_category_item.dart';
import 'package:todo_app/screens/home/widgets/home_container.dart';

import 'package:todo_app/models/todo.dart';
import 'package:todo_app/screens/home/widgets/home_todo_item.dart';
import 'package:todo_app/stores/todo/todo_store.dart';
import 'package:todo_app/util/constants.dart';

import 'package:todo_app/database_redefinition.dart';
import 'package:todo_app/widgets/card/t_basic_card.dart';
import 'package:todo_app/widgets/list/t_categories_list.dart';
import 'package:todo_app/widgets/text/t_text_separator.dart';
import 'package:todo_app/widgets/text/t_title.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TodoStore todoStore = TodoStore();

  navigateToCreateTodoScreen() async {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CreateTodoScreen(),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    // buildDatabaseStuff().then((_) {
    this.todoStore.getCategories();
    this.todoStore.getTodos();
    // });
  }

  List<Widget> _renderCategoriesList() {
    return List.from(
      this.todoStore.todosCategories.map(
            (Category category) => HomeCategoryItem(
              todoStore: this.todoStore,
              category: category,
            ),
          ),
    );
  }

  calculateRemainingTasks(Category category) {
    int counter = 0;
    this.todoStore.todos.forEach((Todo todo) {
      if (category.id == todo.categoryId) counter++;
    });
    return counter;
  }

  @override
  Widget build(BuildContext context) {
    return HomeContainer(pageContent: [
      Container(
        padding: EdgeInsets.symmetric(vertical: padding1, horizontal: padding),
        child: TTitle(title: 'What\'s up, Matheus!'),
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: padding),
            child: TTextSeparator(
              title: 'CATEGORIES',
              spacedLetters: true,
            ),
          ),
          Observer(
            builder: (_) => SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: padding1),
                child: HomeCategoriesList(store: this.todoStore),
              ),
            ),
          )
        ],
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: padding2,
              horizontal: padding1,
            ),
            child: TTextSeparator(title: 'TODAY\'S TASKs', spacedLetters: true),
          ),
          Column(
            children: List.from(
              this.todoStore.todos.map((Todo todo) => HomeTodoItem(todo: todo)),
            ),
          ),
        ],
      ),
    ]);
  }
}
