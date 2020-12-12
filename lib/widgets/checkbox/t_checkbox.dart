import 'package:flutter/material.dart';

import 'package:todo_app/util/constants.dart';

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
        height: 25,
        width: 25,
        decoration: BoxDecoration(
          color: this.widget.isChecked
              ? textSecondaryColor.withOpacity(.7)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(50),
          border: this.widget.isChecked
              ? null
              : Border.all(
                  color: secondaryColor,
                  width: 2,
                ),
        ),
        child: this.widget.isChecked
            ? Icon(Icons.done, color: Colors.white, size: 16)
            : null,
      ),
    );
  }
}
