// The Add Task Page.
/* Here we add tasks.*/
import 'package:flutter/material.dart';
import 'package:pomodoro_app/ui/drawer.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';

class AddTask extends StatefulWidget {
  AddTask({Key key}) : super(key: key);

  @override
  _AddTaskState createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
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
                    child: Text('Add Task'),
                    color: Theme.of(context).primaryColor,
                    textColor: Theme.of(context).textTheme.button.color,
                    onPressed: () {
                      Scaffold.of(context).showSnackBar(
                          SnackBar(content: Text("Task has been added")));
                    },
                  ),
                ],
              ),
            ),
          );
        }));
  }
}
