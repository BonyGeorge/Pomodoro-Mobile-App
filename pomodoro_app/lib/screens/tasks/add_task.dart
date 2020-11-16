// The Add Task Page.
/* Here we add tasks.*/
import 'package:flutter/material.dart';
import 'package:pomodoro_app/screens/tasks/tasks.dart';
import 'package:pomodoro_app/ui/drawer.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';

class AddTask extends StatefulWidget {
  AddTask({Key key}) : super(key: key);

  @override
  _AddTaskState createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: GradientAppBar(
          title: Text('Pomodoro App'),
          backgroundColorStart: Colors.cyan,
          backgroundColorEnd: Colors.green,
        ),
        drawer: MyDrawer(),
        body: Column(
          children: [
            SizedBox(
              height: 40,
            ),
            Text(
              "Add Task.",
              style: TextStyle(fontSize: 30),
            ),
            SizedBox(
              height: 40,
            ),
            TextFormField(
              maxLength: 20,
              decoration: const InputDecoration(
                icon: Icon(Icons.timelapse),
                hintText: 'What is the task title?',
                labelText: 'Task Title *',
              ),
              onSaved: (String value) {},
              validator: (String value) {
                return value.contains('@') ? 'Do not use the @ char.' : null;
              },
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              decoration: const InputDecoration(
                icon: Icon(Icons.date_range),
                hintText: 'When does your task begin and end?',
                labelText: 'Task Date *',
              ),
              onSaved: (String value) {},
              validator: (String value) {
                return value.contains('@') ? 'Do not use the @ char.' : null;
              },
              keyboardType: TextInputType.number,
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: 200.00,
              child: RaisedButton(
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => Task()));
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
                          colors: [
                            Colors.greenAccent,
                            Colors.lightGreenAccent
                          ]),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Container(
                      constraints:
                          BoxConstraints(maxWidth: 200.0, minHeight: 50.0),
                      alignment: Alignment.center,
                      child: Text(
                        "Add",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25.0,
                            fontWeight: FontWeight.w300),
                      ),
                    ),
                  )),
            ),
          ],
        ));
  }
}
