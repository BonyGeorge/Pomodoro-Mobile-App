// The Drawer of our App.
/* Here is the drawer where the user can navigate to any screen he wants.*/
import 'package:flutter/material.dart';
import 'package:pomodoro_app/screens/profile/profile.dart';
import 'package:pomodoro_app/screens/about/about_promodoro.dart';
import 'package:pomodoro_app/screens/projects/projects.dart';
import 'package:pomodoro_app/screens/tasks/tasks.dart';

import 'package:pomodoro_app/providers/auth.dart';
import 'package:provider/provider.dart';

/* The Drawer Structure. */
class MyDrawer extends StatelessWidget {
  MyDrawer({Key key}) : super(key: key);
/*Consumer<Auth>(
      builder: (_, auth, child) => FutureBuilder(future: auth.autoLogin(), builder: (ctx, authSnapshot) {
        if(auth.user)
      },),*/
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<Auth>(context).user;
    String str = '${user.email}';
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [Colors.blue, Colors.green])),
            accountName: Text('${user.fullName}'),
            accountEmail: Text('${user.email}'),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.blueAccent,
              child: Text(
                str[0],
                style: TextStyle(fontSize: 40.0),
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('My Profile'),
            onTap: () {
              Navigator.of(context).pushNamed(ProfileApp.routeName);
            },
          ),
          ListTile(
            leading: Icon(Icons.timer),
            title: Text('Timer'),
            onTap: () {
              Navigator.pushNamed(context, '/timer');
            },
          ),
          ListTile(
            leading: Icon(Icons.assignment),
            title: Text('My Tasks'),
            onTap: () {
              Navigator.of(context).pushNamed(TaskScreen.routeName);
            },
          ),
          ListTile(
            leading: Icon(Icons.work),
            title: Text('My Projects'),
            onTap: () {
              Navigator.of(context).pushNamed(Project.routeName);
            },
          ),
          ListTile(
            leading: Icon(Icons.help),
            title: Text('About Pomodoro'),
            onTap: () {
              Navigator.of(context).pushNamed(AboutScreen.routeName);
            },
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Logout'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/');
              Provider.of<Auth>(context, listen: false).logout();
            },
          ),
        ],
      ),
    );
  }
}
