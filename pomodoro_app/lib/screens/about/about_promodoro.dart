// The About Page.
/* Here is all of the user needs to know about the Pomodoro idea.*/
import 'package:flutter/material.dart';
import 'package:pomodoro_app/widgets/drawer.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:flutter/gestures.dart';

class AboutScreen extends StatelessWidget {
  static const routeName = '/about';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: GradientAppBar(
          title: Text('About Pomodoro'),
          backgroundColorStart: Colors.cyan,
          backgroundColorEnd: Colors.green,
          centerTitle: true,
        ),
        drawer: MyDrawer(),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                Image.asset('assets/images/timer.png'),
                RichText(
                    text: TextSpan(
                        text: 'What Is the Pomodoro Technique? \n',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic),
                        children: <TextSpan>[
                      TextSpan(
                          text: 'The Pomodoro Technique is a time management system ' +
                              'that encourages people to work with the time they ' +
                              'have—rather than against it. Using this method, you ' +
                              'break your workday into 25-minute chunks separated ' +
                              'by five-minute breaks. These intervals are referred ' +
                              'to as pomodoros. After about four pomodoros, you take' +
                              'a longer break of about 15 to 20 minutes.',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.normal),
                          children: <TextSpan>[
                            TextSpan(
                                text: ' Learn more.',
                                style: TextStyle(
                                    color: Colors.blueAccent, fontSize: 20),
                                recognizer: TapGestureRecognizer())
                          ])
                    ])),
              ],
            ),
          ),
        ));
  }
}
