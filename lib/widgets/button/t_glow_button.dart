import 'package:flutter/material.dart';

class TGlowButton extends StatelessWidget {
  final Color color;
  final String text;
  final IconData icon;
  final Function onTap;

  const TGlowButton(
    this.text, {
    Key key,
    this.onTap,
    this.color,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        boxShadow: [
          BoxShadow(
            color: this.color.withOpacity(.8),
            offset: Offset(0, 3),
            blurRadius: 10,
          )
        ],
      ),
      child: RaisedButton(
        color: this.color,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
        onPressed: this.onTap,
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                this.text,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                  color: Colors.white,
                ),
              ),
              SizedBox(width: 10),
              Icon(this.icon, color: Colors.white),
            ],
          ),
        ),
      ),
    );
  }
}
