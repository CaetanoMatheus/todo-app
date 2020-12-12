import 'package:flutter/material.dart';

import 'package:todo_app/widgets/text/t_text_separator.dart';

import 'package:todo_app/util/constants.dart';

class TBasicCard extends StatelessWidget {
  final String smallText;
  final String title;
  final Color color;

  const TBasicCard({
    Key key,
    this.smallText,
    this.title,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      padding: EdgeInsets.only(top: 25, right: 20, bottom: 20, left: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: borderRadius,
        boxShadow: [
          BoxShadow(
            color: Colors.grey[200],
            offset: Offset(2, 3),
            blurRadius: 5,
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TTextSeparator(title: this.smallText, spacedLetters: false),
          SizedBox(height: 10),
          Text(
            this.title,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: primaryColor,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          SizedBox(height: 10),
          Container(
            height: 5,
            decoration: BoxDecoration(
              color: this.color,
              borderRadius: borderRadius,
            ),
          ),
        ],
      ),
    );
  }
}
