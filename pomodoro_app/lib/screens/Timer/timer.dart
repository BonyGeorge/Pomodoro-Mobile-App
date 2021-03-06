// The Timer Screen.
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:pomodoro_app/widgets/drawer.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:intl/intl.dart';

class TimerScreen extends StatefulWidget {
  static const routeName = '/timer';
  TimerScreen({Key key}) : super(key: key);

  @override
  _TimerScreenState createState() => _TimerScreenState();
}

class _TimerScreenState extends State<TimerScreen> {
  int _seconds = 00;
  int _minutes = 25;
  Timer _timer;

  var f = NumberFormat("00");

  bool _canShowButton = true;
  bool _canShowReset = false;
  bool _canShowPause = false;

  bool state = false;

  void hideWidget() {
    setState(() {
      _canShowButton = !_canShowButton;
      _canShowReset = !_canShowReset;
      _canShowPause = !_canShowPause;
    });
  }

  void _restartTimer() {
    if (_timer != null) {
      _timer.cancel();
      _seconds = 0;
      _minutes = 25;
    }
  }

  void _stopTimer() {
    _timer.cancel();
  }

  void _toggleTimer(bool state) {
    state = !state;
    if (state) {
      _resumeTimer();
    } else {
      _stopTimer();
    }
  }

  void _startTimer() {
    if (_seconds > 60) {
      _minutes = (_seconds / 60).floor();
      _seconds -= (_minutes * 60);
    }
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_seconds > 0) {
          _seconds--;
        } else {
          if (_minutes > 0) {
            _seconds = 59;
            _minutes--;
          } else {
            _timer.cancel();
            print("Timer Complete");
          }
        }
      });
    });
  }

  void _resumeTimer() {
    _timer.cancel();
  }

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: MyDrawer(),
        appBar: GradientAppBar(
          title: Text('Pomodoro Timer'),
          backgroundColorStart: Colors.cyan,
          backgroundColorEnd: Colors.green,
        ),
        backgroundColor: Colors.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${f.format(_minutes)} : ${f.format(_seconds)}",
                  style: TextStyle(
                    color: Colors.cyan[900],
                    fontSize: 58,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 100,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                !_canShowButton
                    ? const SizedBox.shrink()
                    : RaisedButton(
                        onPressed: () {
                          setState(() {
                            _startTimer();
                            hideWidget();
                          });
                        },
                        color: Colors.green[400],
                        shape:
                            CircleBorder(side: BorderSide(color: Colors.green)),
                        child: Padding(
                          padding: const EdgeInsets.all(40.0),
                          child: Text(
                            "Start",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                            ),
                          ),
                        ),
                      ),
              ],
            ),
            SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Visibility(
                  visible: _canShowReset,
                  child: RaisedButton(
                    onPressed: () {
                      setState(() {
                        _restartTimer();
                        hideWidget();
                        _canShowButton = true;
                      });
                    },
                    color: Colors.cyan[900],
                    shape:
                        CircleBorder(side: BorderSide(color: Colors.cyan[900])),
                    child: Padding(
                      padding: const EdgeInsets.all(40.0),
                      child: Text(
                        "Reset",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                        ),
                      ),
                    ),
                  ),
                ),
                Visibility(
                  visible: _canShowPause,
                  child: RaisedButton(
                    onPressed: () {
                      setState(() {
                        state = !state;
                        _toggleTimer(state);
                        hideWidget();
                      });
                    },
                    color: Colors.cyan,
                    shape: CircleBorder(side: BorderSide(color: Colors.cyan)),
                    child: Padding(
                      padding: const EdgeInsets.all(40.0),
                      child: Text(
                        "Pause",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
