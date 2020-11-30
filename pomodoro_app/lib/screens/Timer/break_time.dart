// The Timer Screen.
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:pomodoro_app/ui/drawer.dart';
import 'package:pomodoro_app/screens/Timer/timer.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:slide_countdown_clock/slide_countdown_clock.dart';

class Break extends StatefulWidget {
  Break({Key key}) : super(key: key);

  @override
  _BreakState createState() => _BreakState();
}

class _BreakState extends State<Break> {
  Duration _duration = Duration(seconds: 10000);
  GlobalKey<ScaffoldState> _key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: MyDrawer(),
        appBar: GradientAppBar(
          title: Text('Break Page'),
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
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Color(0x888158888),
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(0.0),
                        topLeft: Radius.circular(0.0)),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsets.only(top: 30.0, left: 20.0, right: 20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Press the button to work again',
                            style: TextStyle(fontSize: 26.0),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 5.0, vertical: 100.0),
                          child: RaisedButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => TimerScreen()));
                            },
                            color: Color(0xffbb9bf),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(100.0)),
                            child: Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Text(
                                "Work Time",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20.0),
                              ),
                            ),
                          ),
                        ),
                        SlideCountdownClock(
                          duration: Duration(
                            days: 0,
                            hours: 0,
                            minutes: 5,
                          ),
                          slideDirection: SlideDirection.Down,
                          separator: ':',
                          textStyle: TextStyle(
                            fontSize: 36.0,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF00C853),
                          ),
                          separatorTextStyle: TextStyle(
                            fontSize: 36.0,
                            fontWeight: FontWeight.bold,
                          ),
                          shouldShowDays: true,
                          onDone: () => _key.currentState.showSnackBar(
                            SnackBar(
                              content: Text('CountDown Finished.'),
                            ),
                          ),
                        ),
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
