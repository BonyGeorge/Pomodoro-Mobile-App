// The Main of running our code.
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:pomodoro_app/providers/auth.dart';
import 'package:pomodoro_app/providers/tasks.dart';
import 'package:pomodoro_app/providers/projects.dart';
import 'package:pomodoro_app/screens/about/about_promodoro.dart';
import 'package:pomodoro_app/screens/projects/projects.dart';
import 'package:pomodoro_app/screens/tasks/tasks_history.dart';
import 'package:pomodoro_app/screens/projects/ProjectTask.dart';
import 'package:pomodoro_app/screens/register/signup.dart';
import 'package:pomodoro_app/screens/register/forget.dart';
import 'package:pomodoro_app/screens/register/login.dart';
import 'package:pomodoro_app/screens/register/change.dart';
import 'package:pomodoro_app/screens/landing_page.dart';
import 'package:pomodoro_app/screens/profile/profile.dart';
import 'package:pomodoro_app/screens/timer/timer.dart';
import 'package:pomodoro_app/screens/tasks/tasks.dart';
import 'package:pomodoro_app/screens/about/google_maps.dart';

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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Auth()),
        ChangeNotifierProxyProvider<Auth, TaskProvider>(
          create: (_) => TaskProvider(
              Provider.of<Auth>(context, listen: true).token,
              Provider.of<Auth>(context, listen: true).userId, []),
          update: (ctx, auth, tasks) =>
              tasks..receiveToken(auth, tasks.itemsList),
        ),
        ChangeNotifierProxyProvider<Auth, ProjectProvider>(
          create: (_) => ProjectProvider(
              Provider.of<Auth>(context, listen: true).token,
              Provider.of<Auth>(context, listen: true).userId, []),
          update: (ctx, auth, projects) =>
              projects..receiveToken(auth, projects.projectsList),
        )
      ],
      child: MaterialApp(
        title: 'Pomodoro App',
        initialRoute: '/',
        routes: {
          Signin.routeName: (ctx) => Signin(),
          Signup.routeName: (ctx) => Signup(),
          ChangePassword.routeName: (ctx) => ChangePassword(),
          ProfileApp.routeName: (ctx) => ProfileApp(),
          TimerScreen.routeName: (ctx) => TimerScreen(),
          ForgetPassword.routeName: (ctx) => ForgetPassword(),
          Project.routeName: (ctx) => Project(),
          TaskScreen.routeName: (ctx) => TaskScreen(),
          HistoryScreen.routeName: (ctx) => HistoryScreen(),
          AddPTask.routeName: (ctx) => AddPTask(),
          AboutScreen.routeName: (ctx) => AboutScreen(),
          GoogleMaps.routeName: (ctx) => GoogleMaps(),
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
    Timer(Duration(seconds: 5), () async {
      final lis = await Provider.of<Auth>(context, listen: false).autoLogin();
      if (lis == true) {
        Navigator.pushNamed(context, TimerScreen.routeName);
      } else {
        Navigator.pushNamed(context, Signup.routeName);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return LandingPage();
  }
}
