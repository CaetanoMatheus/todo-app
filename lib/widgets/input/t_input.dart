import 'package:flutter/material.dart';

import 'package:todo_app/util/constants.dart';

class TInput extends StatelessWidget {
  final String label;
  final TextEditingController controller;

  const TInput({Key key, this.label, this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: this.controller,
      scrollPhysics: BouncingScrollPhysics(),
      cursorHeight: 30,
      style: TextStyle(
        fontSize: 24,
        color: textPrimaryColor,
      ),
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: this.label,
        hintStyle: TextStyle(
          color: textSecondaryColor,
          fontSize: 22,
        ),
      ),
    );
  }
}
