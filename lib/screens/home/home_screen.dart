import 'package:flutter/material.dart';
import 'package:todo_app/widgets/text/t_title.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(),
      drawer: Drawer(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {},
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [TTitle(title: 'What\'s up, Matheus!')],
        ),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.grey[600]),
      actions: [
        IconButton(icon: Icon(Icons.search), onPressed: null),
        IconButton(icon: Icon(Icons.notifications_outlined), onPressed: null),
      ],
    );
  }
}
