import 'package:flutter/material.dart';

import 'package:todo_app/widgets/text/t_title.dart';

class HomeGreetings extends StatelessWidget {
  final String message;

  const HomeGreetings(this.message, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: TTitle(title: this.message),
    );
  }
}
