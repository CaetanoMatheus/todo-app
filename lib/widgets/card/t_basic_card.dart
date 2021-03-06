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
      height: 120,
      padding: EdgeInsets.only(top: 25, right: 20, bottom: 20, left: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: borderRadius,
        boxShadow: [
          BoxShadow(
            color: textSecondaryColor.withOpacity(.3),
            offset: Offset(2, 4),
            blurRadius: 15,
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          this.smallText != null
              ? TTextSeparator(title: this.smallText, spacedLetters: false)
              : Container(),
          SizedBox(height: 10),
          Text(
            this.title,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: primaryColor,
              fontWeight: FontWeight.bold,
              fontSize: 22,
              letterSpacing: .3,
            ),
          ),
          SizedBox(height: 15),
          Container(
            height: 5,
            decoration: BoxDecoration(
              color: this.color,
              borderRadius: borderRadius,
              boxShadow: [
                BoxShadow(
                  color: this.color.withOpacity(.6),
                  offset: Offset(2, 2),
                  blurRadius: 8,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
