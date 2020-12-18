import 'package:flutter/material.dart';

import 'package:todo_app/router/app_router.dart';
import 'package:todo_app/util/constants.dart';

class HomeFloatingActionButton extends StatelessWidget {
  _navigateToCreateTodoScreen(BuildContext context) {
    Navigator.of(context).pushNamed(AppRouter.createTodoRoute);
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: accentColor,
      child: Icon(Icons.add),
      onPressed: () => this._navigateToCreateTodoScreen(context),
    );
  }
}
