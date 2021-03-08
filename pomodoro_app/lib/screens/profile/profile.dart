import 'package:flutter/material.dart';
import 'package:pomodoro_app/screens/Profile/editprofile.dart';
import 'package:pomodoro_app/widgets/drawer.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:pomodoro_app/providers/auth.dart';
import 'package:provider/provider.dart';
class ProfileApp extends StatelessWidget {
  static const routeName = '/profile';
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<Auth>(context).user;
    String str = '${user.email}';
    return Scaffold(
      drawer: MyDrawer(),
      appBar: GradientAppBar(
        title: Text('My Profile'),
        backgroundColorStart: Colors.cyan,
        backgroundColorEnd: Colors.green,
      ),
      body: Column(
        children: <Widget>[
          Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.greenAccent, Colors.blueAccent])),
              child: Container(
                width: double.infinity,
                height: 210.0,
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CircleAvatar(
                         backgroundColor: Colors.blueAccent,
              child: Text( 
                str[0],
                style: TextStyle(fontSize: 40.0),
              ),
                        radius: 60.0,
                      ),
                      SizedBox(
                        height: 6.0,
                      ),
                      Text(
                        "${user.username}",
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: 6.0,
                      ),
                    ],
                  ),
                ),
              )),
          Container(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Full Name:",
                    style: TextStyle(
                        color: Colors.greenAccent,
                        fontStyle: FontStyle.normal,
                        fontSize: 20.0),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    '${user.fullname}',
                    style: TextStyle(
                      fontSize: 15.0,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w300,
                      color: Colors.black,
                      letterSpacing: 2.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
              child: Column(
                children: <Widget>[
                  Text(
                    "E-mail:",
                    style: TextStyle(
                        color: Colors.greenAccent,
                        fontStyle: FontStyle.normal,
                        fontSize: 20.0),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    '${user.email}',
                    style: TextStyle(
                      fontSize: 15.0,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w300,
                      color: Colors.black,
                      letterSpacing: 2.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
              child: Column(
                children: <Widget>[
                  Text(
                    "Phone Number:",
                    style: TextStyle(
                        color: Colors.greenAccent,
                        fontStyle: FontStyle.normal,
                        fontSize: 20.0),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    '${user.mobile}',
                    style: TextStyle(
                      fontSize: 15.0,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w300,
                      color: Colors.black,
                      letterSpacing: 2.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
         
          Container(
            width: 160.00,
            child: RaisedButton(
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => Editprofile()));
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(60.0)),
                elevation: 0.0,
                padding: EdgeInsets.all(0.0),
                child: Ink(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.centerRight,
                        end: Alignment.centerLeft,
                        colors: [Colors.green, Colors.green]),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Container(
                    constraints:
                        BoxConstraints(maxWidth: 200.0, minHeight: 50.0),
                    alignment: Alignment.center,
                    child: Text(
                      "Edit",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25.0,
                          fontWeight: FontWeight.w300),
                    ),
                  ),
                )),
          ),
        ],
      ),
    );
  }
}
