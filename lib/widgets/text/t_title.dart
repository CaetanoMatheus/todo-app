import 'package:flutter/material.dart';

import 'package:todo_app/util/constants.dart';

class TTitle extends StatelessWidget {
  final String title;

  const TTitle({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      this.title,
      style: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
        color: primaryColor,
      ),
    );
  }
}
