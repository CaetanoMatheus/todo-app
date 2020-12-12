import 'package:flutter/material.dart';

class TCheckbox extends StatefulWidget {
  final bool isChecked;
  final Color borderColor;
  final Function onTap;

  const TCheckbox({
    Key key,
    this.isChecked,
    this.borderColor,
    this.onTap,
  }) : super(key: key);

  @override
  _TCheckboxState createState() => _TCheckboxState();
}

class _TCheckboxState extends State<TCheckbox> {
  void _toggleChecked() {
    this.widget.onTap(!this.widget.isChecked);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this._toggleChecked,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        height: 30,
        width: 30,
        decoration: BoxDecoration(
          color: this.widget.isChecked
              ? this.widget.borderColor
              : Colors.transparent,
          borderRadius: BorderRadius.circular(50),
          border: this.widget.isChecked
              ? null
              : Border.all(
                  color: this.widget.borderColor ?? Colors.grey,
                  width: 3,
                ),
        ),
        child: this.widget.isChecked
            ? Icon(Icons.done, color: Colors.white)
            : null,
      ),
    );
  }
}
