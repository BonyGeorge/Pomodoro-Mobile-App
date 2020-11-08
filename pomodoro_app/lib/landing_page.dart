// The Landing Page.
import 'package:flutter/material.dart';

void main() {
  runApp(LandingPage());
}

class LandingPage extends StatefulWidget {
  LandingPage({Key key}) : super(key: key);

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [Colors.blue, Colors.green])),
      child: Center(
        child: Text(
          'Pomodoro Timer',
          style: TextStyle(
              fontSize: 48.0, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
    )));
  }
}
