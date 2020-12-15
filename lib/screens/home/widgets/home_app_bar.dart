import 'package:flutter/material.dart';

import 'package:todo_app/util/constants.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor,
      elevation: 0,
      iconTheme: IconThemeData(color: textSecondaryColor),
      leading: Builder(
        builder: (BuildContext context) => Padding(
          padding: EdgeInsets.symmetric(horizontal: padding2),
          child: IconButton(
            icon: Icon(Icons.menu, size: iconsSize),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.search, color: textSecondaryColor, size: iconsSize),
          onPressed: () {},
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: padding2),
          child: IconButton(
            icon: Icon(
              Icons.notifications_outlined,
              color: textSecondaryColor,
              size: iconsSize,
            ),
            onPressed: () {},
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => new Size.fromHeight(AppBar().preferredSize.height);
}
