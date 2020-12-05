// The Add Task Page.
/* Here we add tasks.*/
import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:pomodoro_app/models/task.dart';
import 'package:intl/intl.dart';

class AddTask extends StatefulWidget {
  AddTask({Key key}) : super(key: key);

  @override
  _AddTaskState createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  // Map<String, List> _usertasks;
  List tasks = [];
  Task task;
  var _formKey = GlobalKey<FormState>();
  TextEditingController taskController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  DateTime startDate;
  DateTime dueDate;

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: GradientAppBar(
          title: Text('Add new Task'),
          backgroundColorStart: Colors.cyan,
          backgroundColorEnd: Colors.green,
        ),
        body: Form(
            key: _formKey,
            child: Column(children: <Widget>[
              Expanded(
                  child: Container(
                      child: Padding(
                          padding: EdgeInsets.only(
                              top: 4.0, left: 20.0, right: 20.0),
                          child: Column(children: <Widget>[
                            TextFormField(
                              controller: taskController,
                              decoration:
                                  InputDecoration(labelText: 'Task Title*'),
                              validator: (String value) {
                                return value.isEmpty
                                    ? "Task name is required"
                                    : null;
                              },
                            ),
                            TextFormField(
                              controller: descriptionController,
                              decoration: InputDecoration(
                                  labelText: 'Task Description'),
                            ),
                            FlatButton(
                              textColor: Colors.green,
                              child: Text(
                                'Choose Start Date',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.green),
                              ),
                              onPressed: _startDatePicker,
                            ),
                            Container(
                              height: 200,
                              width: 500,
                              child: Column(
                                children: <Widget>[
                                  Expanded(
                                    child: Text(
                                      startDate == null
                                          ? 'No Date Chosen!'
                                          : 'Picked Date: ${DateFormat.yMd().format(startDate)}',
                                    ),
                                  ),
                                  FlatButton(
                                    textColor: Colors.green,
                                    child: Text(
                                      'Choose End Date',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.green),
                                    ),
                                    onPressed: _endDatePicker,
                                  ),
                                  Container(
                                    height: 100,
                                    width: 500,
                                    child: Column(
                                      children: <Widget>[
                                        Expanded(
                                          child: Text(
                                            dueDate == null
                                                ? 'No Date Chosen!'
                                                : 'Picked Date: ${DateFormat.yMd().format(dueDate)}',
                                          ),
                                        ),
                                        RaisedButton(
                                            onPressed: () {
                                              setState(() {
                                                addUserTask(
                                                  userID: "1",
                                                  title: taskController.text,
                                                  desc: descriptionController
                                                      .text,
                                                  isCompleted: false,
                                                  startDate: startDate,
                                                  dueDate: dueDate,
                                                );
                                              });
                                              Navigator.pushNamed(
                                                  context, '/tasks');
                                            },
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        60.0)),
                                            elevation: 0.0,
                                            padding: EdgeInsets.all(0.0),
                                            child: Ink(
                                              decoration: BoxDecoration(
                                                gradient: LinearGradient(
                                                    begin:
                                                        Alignment.centerRight,
                                                    end: Alignment.centerLeft,
                                                    colors: [
                                                      Colors.green,
                                                      Colors.green
                                                    ]),
                                                borderRadius:
                                                    BorderRadius.circular(20.0),
                                              ),
                                              child: Container(
                                                constraints: BoxConstraints(
                                                    maxWidth: 200.0,
                                                    minHeight: 50.0),
                                                alignment: Alignment.center,
                                                child: Text(
                                                  "Add",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 25.0,
                                                      fontWeight:
                                                          FontWeight.w300),
                                                ),
                                              ),
                                            )),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ]))))
            ])));
  }

// User adds a task.
  void addUserTask({
    String userID,
    String title,
    String desc,
    DateTime startDate,
    DateTime dueDate,
    bool isCompleted,
  }) {
    task = Task.fillConst(
        userID: userID,
        title: title,
        startDate: startDate,
        dueDate: dueDate,
        isCompleted: isCompleted);
    setState(() {
      tasks.add(task);
      // _usertasks.putIfAbsent(userID, () => tasks);
    });
  }

  void _startDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        startDate = pickedDate;
      });
    });
    print('...');
  }

  void _endDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        dueDate = pickedDate;
      });
    });
    print('...');
  }
}
