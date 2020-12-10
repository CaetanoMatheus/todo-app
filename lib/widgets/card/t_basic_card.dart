import 'package:flutter/material.dart';
import 'package:todo_app/widgets/text/t_text_separator.dart';

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
      width: 160,
      height: 90,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
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
          TTextSeparator(title: this.smallText),
          SizedBox(height: 10),
          Text(
            this.title,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: Color(0xff34495e),
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          SizedBox(height: 10),
          Container(
            height: 5,
            decoration: BoxDecoration(
              color: this.color,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ],
      ),
    );
  }
}
