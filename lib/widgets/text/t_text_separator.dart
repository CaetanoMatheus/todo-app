import 'package:flutter/material.dart';

import 'package:todo_app/util/constants.dart';

class TTextSeparator extends StatelessWidget {
  final String title;
  final bool spacedLetters;

  const TTextSeparator({
    Key key,
    this.title,
    this.spacedLetters,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      this.title,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        color: textSecondaryColor,
        letterSpacing: this.spacedLetters ? 1 : 0,
        fontWeight: fontWeight,
      ),
    );
  }
}
