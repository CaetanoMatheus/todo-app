import 'package:flutter/material.dart';

import 'package:todo_app/util/constants.dart';

class TCloseButton extends StatelessWidget {
  final Function onTap;

  const TCloseButton({Key key, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: textSecondaryColor.withOpacity(.5),
          width: 2,
        ),
        borderRadius: BorderRadius.circular(50),
      ),
      child: IconButton(
        icon: Icon(Icons.close, color: primaryColor),
        splashRadius: 27,
        onPressed: () => onTap(context),
      ),
    );
  }
}
