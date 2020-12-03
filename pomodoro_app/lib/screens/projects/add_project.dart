// The Add Task Page.
/* Here we add tasks.*/
import 'package:flutter/material.dart';
import 'package:pomodoro_app/screens/projects/projects.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';

class AddProject extends StatefulWidget {
  AddProject({Key key}) : super(key: key);

  @override
  _AddProjectState createState() => _AddProjectState();
}

class _AddProjectState extends State<AddProject> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: GradientAppBar(
          title: Text('Add new project'),
          backgroundColorStart: Colors.cyan,
          backgroundColorEnd: Colors.green,
        ),
        body: Container(
          child: Column(
            children: <Widget>[
              Expanded(
                child: Container(
                  width: double.infinity,
                  child: Padding(
                    padding:
                        EdgeInsets.only(top: 30.0, left: 20.0, right: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        TextField(
                          decoration:
                              InputDecoration(labelText: 'Project Title'),
                        ),
                        TextField(
                          decoration:
                              InputDecoration(labelText: 'Add Task name'),
                          keyboardType: TextInputType.number,
                          onSubmitted: null,
                          // onChanged: (val) => amountInput = val,
                        ),
                        Container(
                          height: 70,
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                child: Text(
                                  '',
                                ),
                              ),
                            ],
                          ),
                        ),
                        RaisedButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Project()));
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
                                constraints: BoxConstraints(
                                    maxWidth: 200.0, minHeight: 50.0),
                                alignment: Alignment.center,
                                child: Text(
                                  "Done",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 25.0,
                                      fontWeight: FontWeight.w300),
                                ),
                              ),
                            )),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
