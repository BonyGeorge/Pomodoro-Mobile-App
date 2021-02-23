// The Main of running our code.
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pomodoro_app/providers/tasks.dart';
import 'package:pomodoro_app/screens/about/about_promodoro.dart';
import 'package:pomodoro_app/screens/projects/add_project.dart';
import 'package:pomodoro_app/screens/projects/projects.dart';
import 'package:pomodoro_app/screens/tasks/tasks_history.dart';
import 'package:pomodoro_app/widgets/add_task.dart';
import 'package:provider/provider.dart';
import 'screens/register/signup.dart';
import 'screens/register/forget.dart';
import 'screens/register/login.dart';
import 'screens/landing_page.dart';
import './screens/Profile/profile.dart';
import './screens/Timer/timer.dart';
import './screens/Timer/break_time.dart';
import './screens/tasks/tasks.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => TaskProvider(),
      child: MaterialApp(
        title: 'Pomodoro App',
        initialRoute: '/',
        routes: {
          '/login': (context) => Signin(),
          '/signup': (context) => Signup(),
          '/profile': (context) => ProfileApp(),
          '/timer': (context) => TimerScreen(),
          '/break': (context) => Break(),
          '/forget': (context) => ForgetPassword(),
          '/addtasks': (context) => AddNewTask(),
          '/addprojects': (context) => AddProject(),
          '/projects': (context) => Project(),
          TaskScreen.routeName: (ctx) => TaskScreen(),
          HistoryScreen.routeName: (ctx) => HistoryScreen(),
          AboutScreen.routeName: (ctx) => AboutScreen(),
        },
        theme: ThemeData(
            visualDensity: VisualDensity.adaptivePlatformDensity,
            fontFamily: 'Lato'),
        home: MyHomePage(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

/* We used Asynchronus here to navigate to the signup screen after a timer of 
5 secands. */
class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 5),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Signup())));
  }

  @override
  Widget build(BuildContext context) {
    return LandingPage();
  }
}
