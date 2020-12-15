import 'package:flutter/material.dart';

import 'package:todo_app/screens/home/widgets/home_app_bar.dart';
import 'package:todo_app/screens/home/widgets/home_drawer.dart';
import 'package:todo_app/screens/home/widgets/home_floating_action_button.dart';

import 'package:todo_app/util/constants.dart';

class HomeContainer extends StatelessWidget {
  final List<Widget> pageContent;

  const HomeContainer({Key key, this.pageContent}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: HomeAppBar(),
      drawer: HomeDrawer(),
      floatingActionButton: HomeFloatingActionButton(),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.only(bottom: padding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: this.pageContent,
          ),
        ),
      ),
    );
  }
}
