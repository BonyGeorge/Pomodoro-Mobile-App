import 'package:flutter/material.dart';
import 'package:pomodoro_app/widgets/drawer.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';

class AddPTask extends StatefulWidget {
  AddPTask({Key key}) : super(key: key);
  @override
  _AddPTaskState createState() => _AddPTaskState();
}

class _AddPTaskState extends State<AddPTask> {
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: GradientAppBar(
          title: Text('Add Task'),
          backgroundColorStart: Colors.cyan,
          backgroundColorEnd: Colors.green,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(
                  context,
                );
              },
            ),
          ],
        ),
        drawer: MyDrawer(),
        body: Builder(builder: (BuildContext context) {
          return Card(
            elevation: 5,
            child: Container(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  TextField(
                    decoration: InputDecoration(labelText: 'Title'),
                  ),
                  TextField(
                    decoration: InputDecoration(labelText: 'Description'),
                    keyboardType: TextInputType.multiline,
                    onSubmitted: null,
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
                              colors: [Colors.green, Colors.green]),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Container(
                          constraints:
                              BoxConstraints(maxWidth: 200.0, minHeight: 50.0),
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
          );
        }));
  }
}
