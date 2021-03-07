// The Main of running our code.
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pomodoro_app/providers/tasks.dart';
import 'package:pomodoro_app/screens/about/about_promodoro.dart';
import 'package:pomodoro_app/screens/projects/add_project.dart';
import 'package:pomodoro_app/screens/projects/projects.dart';
import 'package:pomodoro_app/screens/tasks/tasks_history.dart';
import 'package:provider/provider.dart';
import 'screens/register/signup.dart';
import 'screens/register/forget.dart';
import 'screens/register/login.dart';
import 'screens/register/change.dart';
import 'screens/landing_page.dart';
import './screens/Profile/profile.dart';
import './screens/Timer/timer.dart';
import './screens/tasks/tasks.dart';
import './providers/auth.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => Auth(),
    child: MyApp(),
  ));
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
          Signin.routeName: (ctx) => Signin(),
          Signup.routeName: (ctx) => Signup(),
          Change.routeName: (ctx) => Change(),
          ProfileApp.routeName: (ctx) => ProfileApp(),
          TimerScreen.routeName: (ctx) => TimerScreen(),
          ForgetPassword.routeName: (ctx) => ForgetPassword(),
          '/addprojects': (ctx) => AddProject(),
          Project.routeName: (ctx) => Project(),
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
    Timer(Duration(seconds: 5),
        () => Navigator.pushNamed(context, Signup.routeName));
  }

  @override
  Widget build(BuildContext context) {
    return LandingPage();
  }
}
