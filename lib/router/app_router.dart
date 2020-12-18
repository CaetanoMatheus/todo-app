import 'package:flutter/material.dart';
import 'package:todo_app/screens/create_todo/create_todo_screen.dart';

import 'package:todo_app/screens/home/home_screen.dart';

class AppRouter {
  static const String initialRoute = '/';
  static const String createTodoRoute = '/create_todo';

  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case initialRoute:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case createTodoRoute:
        return MaterialPageRoute(builder: (_) => CreateTodoScreen());
      default:
        return MaterialPageRoute(builder: (_) => HomeScreen());
    }
  }
}
