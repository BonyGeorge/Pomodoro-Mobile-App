// The Drawer of our App.
/* Here is the drawer where the user can navigate to any screen he wants.*/
import 'package:flutter/material.dart';

/* The Drawer Structure. */
class MyDrawer extends StatelessWidget {
  MyDrawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [Colors.blue, Colors.green])),
            accountName: Text("Promodoro"),
            accountEmail: Text("Promodoro_App@gmail.com"),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.orange,
              child: Text(
                "P",
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
              Navigator.pushNamed(context, '/timer');
            },
          ),
          ListTile(
            leading: Icon(Icons.assignment),
            title: Text('My Tasks'),
            onTap: () {
              Navigator.pushNamed(context, '/tasks');
            },
          ),
          ListTile(
            leading: Icon(Icons.work),
            title: Text('My Projects'),
            onTap: () {
              Navigator.pushNamed(context, '/projects');
            },
          ),
        ],
      ),
    );
  }
}
