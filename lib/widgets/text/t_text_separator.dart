import 'package:flutter/material.dart';

class TTextSeparator extends StatelessWidget {
  final String title;

  const TTextSeparator({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      this.title,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(color: Colors.grey[600]),
    );
  }
}
