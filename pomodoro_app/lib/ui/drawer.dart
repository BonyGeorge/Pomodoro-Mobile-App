// The Drawer to our App.
import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import '../screens/profile.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {'/profile': (context) => ProfileApp()},
      home: MyHomePage(),
    );
  }
}

/* The Drawer Structure. */
class MyHomePage extends StatelessWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GradientAppBar(
        title: Text('Pomodoro App'),
        backgroundColorStart: Colors.cyan,
        backgroundColorEnd: Colors.green,
      ),
      body: Center(child: Text('My Page!')),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [Colors.blue, Colors.green])),
              accountName: Text("Abanoub George"),
              accountEmail: Text("abanoubgeorge@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.orange,
                child: Text(
                  "A",
                  style: TextStyle(fontSize: 40.0),
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('My Profile'),
              onTap: () {
                Navigator.pushNamed(context, '/profile');
              },
            ),
            ListTile(
              leading: Icon(Icons.timer),
              title: Text('Timer'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.assignment),
              title: Text('My Tasks'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.work),
              title: Text('My Projects'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
