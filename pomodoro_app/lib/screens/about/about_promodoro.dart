// The About Page.
/* Here is all of the user needs to know about the Pomodoro idea.*/
import 'package:flutter/material.dart';
import 'package:pomodoro_app/widgets/drawer.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';

class AboutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: GradientAppBar(
          title: Text('About Pomodoro'),
          backgroundColorStart: Colors.cyan,
          backgroundColorEnd: Colors.green,
          centerTitle: true,
        ),
        drawer: MyDrawer(),
        body: Container());
  }
}
