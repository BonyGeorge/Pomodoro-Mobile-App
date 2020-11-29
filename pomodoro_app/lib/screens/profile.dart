import 'package:flutter/material.dart';
import 'package:pomodoro_app/screens/editprofile.dart';
import '../ui/drawer.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';

class ProfileApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: GradientAppBar(
        title: Text('Pomodoro App'),
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
                        backgroundImage: NetworkImage(
                          "https://www.rd.com/wp-content/uploads/2017/09/01-shutterstock_476340928-Irina-Bg.jpg",
                        ),
                        radius: 60.0,
                      ),
                      SizedBox(
                        height: 6.0,
                      ),
                      Text(
                        "@Pomodoro",
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
                    'Pomodoro',
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
                    'Promodoro_App@gmail.com',
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
                    '0123456789',
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
                    "About me:",
                    style: TextStyle(
                        color: Colors.greenAccent,
                        fontStyle: FontStyle.normal,
                        fontSize: 20.0),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    'Student/Developer...',
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
          SizedBox(
            height: 30.0,
          ),
          Container(
            width: 160.00,
            child: RaisedButton(
                onPressed: () {
                  Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => Editprofile()));
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
                        colors: [Colors.greenAccent, Colors.lightGreenAccent]),
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
