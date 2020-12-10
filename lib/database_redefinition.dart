import 'package:flutter/material.dart';
import 'package:todo_app/helpers/category_helper.dart';
import 'package:todo_app/helpers/database_helper.dart';
import 'package:todo_app/models/category.dart';
import 'package:todo_app/models/todo.dart';

import 'helpers/todo_helper.dart';

DatabaseHelper databaseHelper = DatabaseHelper.getInstance();
CategoryHelper categoryHelper = CategoryHelper();
TodoHelper todoHelper = TodoHelper();

final categories = [
  Category.fill('Personal', Colors.purple.value),
  Category.fill('Business', Colors.red.value),
  Category.fill('Study', Colors.green.value),
];

final todos = [
  Todo.fill('Go shopping', false, 1),
  Todo.fill('Wash the Car', true, 2),
  Todo.fill('Clean the house', true, 3),
  Todo.fill('Play with my pets', false, 2),
  Todo.fill('Plant a tree', false, 3),
  Todo.fill('Play videogames', true, 1),
  Todo.fill('Sing a son', true, 2),
  Todo.fill('Take a bath', true, 2),
  Todo.fill('Eat something', false, 1),
  Todo.fill('Buy a new cellphone charger', false, 3),
  Todo.fill('Turn off the lights', false, 3),
  Todo.fill('Workout', false, 3),
  Todo.fill('Go to sleep', false, 1),
];

buildDatabaseStuff() async {
  await databaseHelper.destroyDabase();
  await createElements(categories, categoryHelper);
  await createElements(todos, todoHelper);
}

createElements(list, helper) async {
  for (var element in list) {
    await helper.create(element);
  }
}
