import 'package:flutter/material.dart';

import 'package:todo_app/util/constants.dart';

class HomeFloatingActionButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: accentColor,
      child: Icon(Icons.add),
      onPressed: () {},
    );
  }
}
