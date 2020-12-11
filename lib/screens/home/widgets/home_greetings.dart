import 'package:flutter/material.dart';

import 'package:todo_app/widgets/text/t_title.dart';

import 'package:todo_app/util/constants.dart';

class HomeGreetings extends StatelessWidget {
  final String message;

  const HomeGreetings(this.message, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(padding1),
      child: TTitle(title: this.message),
    );
  }
}
