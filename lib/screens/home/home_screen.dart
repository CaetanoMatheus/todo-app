import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:todo_app/models/category.dart';
import 'package:todo_app/screens/create_todo/create_todo_screen.dart';
import 'package:todo_app/screens/home/sections/categories_section.dart';
import 'package:todo_app/screens/home/widgets/home_container.dart';

import 'package:todo_app/models/todo.dart';
import 'package:todo_app/stores/category/category_store.dart';
import 'package:todo_app/stores/todo/todo_store.dart';
import 'package:todo_app/util/constants.dart';

import 'package:todo_app/database_redefinition.dart';
import 'package:todo_app/widgets/card/t_basic_card.dart';
import 'package:todo_app/widgets/card/t_todo_card.dart';
import 'package:todo_app/widgets/text/t_text_separator.dart';
import 'package:todo_app/widgets/text/t_title.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TodoStore todoStore = TodoStore();
  final CategoryStore categoryStore = CategoryStore();

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
    this.categoryStore.getAll();
    this.todoStore.getAll();
    // });
  }

  int _calculateRemainingTasks(Category category) {
    int counter = 0;
    this.todoStore.todos.forEach((Todo todo) {
      if (category.id == todo.categoryId) counter++;
    });
    return counter;
  }

  @override
  Widget build(BuildContext context) {
    return HomeContainer(
      pageContent: [
        Container(
          padding:
              EdgeInsets.symmetric(vertical: padding1, horizontal: padding),
          child: TTitle(title: 'What\'s up, Matheus!'),
        ),
        CategoriesSection(
          categoryStore: this.categoryStore,
          todoStore: this.todoStore,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: padding2,
                horizontal: padding1,
              ),
              child:
                  TTextSeparator(title: 'TODAY\'S TASKS', spacedLetters: true),
            ),
            Observer(
              builder: (_) => Column(
                children: List.from(this.todoStore.todos.map(
                      (Todo todo) => Dismissible(
                        key: Key(todo.id.toString()),
                        onDismissed: (_) => this.todoStore.destroy(todo),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: padding1 - 5,
                            vertical: padding3,
                          ),
                          child: TTodoCard(
                            todo: todo,
                            onChange: (_) {
                              this.todoStore.toggleCheck(todo);
                            },
                          ),
                        ),
                      ),
                    )),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
