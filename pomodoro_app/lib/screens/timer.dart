// The Timer Screen.
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import '../ui/drawer.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';

class TimerScreen extends StatefulWidget {
  TimerScreen({Key key}) : super(key: key);

  @override
  _TimerScreenState createState() => _TimerScreenState();
}

class _TimerScreenState extends State<TimerScreen> {
  double percent = 0;
  static int timeInMinute = 25;
  int timeInSec = timeInMinute * 60;
  //first we need to import async library and add a timer object
  Timer timer;
// start code timer function
  _StartTimer() {
    print("test");
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: MyDrawer(),
        appBar: GradientAppBar(
          title: Text('Pomodoro App'),
          backgroundColorStart: Colors.cyan,
          backgroundColorEnd: Colors.green,
        ),
        body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [Colors.blue, Colors.green],
          )),
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 25.0),
                child: Text(
                  "Pomodoro Clock",
                  style: TextStyle(color: Colors.black, fontSize: 20.0),
                ),
              ),
              Expanded(
                child: CircularPercentIndicator(
                  circularStrokeCap: CircularStrokeCap.round,
                  percent: percent,
                  animation: true,
                  animateFromLastPercent: true,
                  radius: 250.0,
                  lineWidth: 20.0,
                  progressColor: Colors.white,
                  center: Text(
                    "$timeInMinute",
                    style: TextStyle(color: Colors.white, fontSize: 80.0),
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Color(0x888158888),
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(30.0),
                        topLeft: Radius.circular(30.0)),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsets.only(top: 30.0, left: 20.0, right: 20.0),
                    child: Column(
                      children: <Widget>[
                        Expanded(
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                child: Column(
                                  children: <Widget>[
                                    Text(
                                      "Think Time",
                                      style: TextStyle(fontSize: 15.0),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "25",
                                      style: TextStyle(fontSize: 50.0),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  children: <Widget>[
                                    Text(
                                      "Pause Time",
                                      style: TextStyle(fontSize: 15.0),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "5",
                                      style: TextStyle(fontSize: 50.0),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 28.0),
                          child: RaisedButton(
                            onPressed: _StartTimer,
                            color: Color(0xffbb9bf),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(100.0)),
                            child: Padding(
                              padding: EdgeInsets.all(20.0),
                              child: Text(
                                "Start Pomodoro",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 22.0),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
