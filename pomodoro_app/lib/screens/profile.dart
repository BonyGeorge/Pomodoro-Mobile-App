import 'package:flutter/material.dart';
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
                height: 270.0,
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CircleAvatar(
                        backgroundImage: NetworkImage(
                          "https://www.rd.com/wp-content/uploads/2017/09/01-shutterstock_476340928-Irina-Bg.jpg",
                        ),
                        radius: 50.0,
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        "Name",
                        style: TextStyle(
                          fontSize: 22.0,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Card(
                        margin: EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 5.0),
                        clipBehavior: Clip.antiAlias,
                        color: Colors.white,
                        elevation: 5.0,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8.0, vertical: 22.0),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                child: Column(
                                  children: <Widget>[
                                    Text(
                                      "Tasks",
                                      style: TextStyle(
                                        color: Colors.greenAccent,
                                        fontSize: 22.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5.0,
                                    ),
                                    Text(
                                      "5200",
                                      style: TextStyle(
                                        fontSize: 20.0,
                                        color: Colors.lightGreenAccent,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  children: <Widget>[
                                    Text(
                                      "Teams",
                                      style: TextStyle(
                                        color: Colors.greenAccent,
                                        fontSize: 22.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5.0,
                                    ),
                                    Text(
                                      "28.5K",
                                      style: TextStyle(
                                        fontSize: 20.0,
                                        color: Colors.lightGreenAccent,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  children: <Widget>[
                                    Text(
                                      "Projects",
                                      style: TextStyle(
                                        color: Colors.greenAccent,
                                        fontSize: 22.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5.0,
                                    ),
                                    Text(
                                      "1300",
                                      style: TextStyle(
                                        fontSize: 20.0,
                                        color: Colors.lightGreenAccent,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )),
          Container(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 30.0, horizontal: 16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Username:",
                    style: TextStyle(
                        color: Colors.greenAccent,
                        fontStyle: FontStyle.normal,
                        fontSize: 20.0),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    '@username',
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
                  const EdgeInsets.symmetric(vertical: 30.0, horizontal: 16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
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
                    'xxxxxx@gmail.com',
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
                  const EdgeInsets.symmetric(vertical: 30.0, horizontal: 16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
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
                    '123456789',
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
            width: 200.00,
            child: RaisedButton(
                onPressed: () {},
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
                      " Edit",
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
