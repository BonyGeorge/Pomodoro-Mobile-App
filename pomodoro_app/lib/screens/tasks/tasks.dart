// The Tasks Page.
/* Here is all of the user daily tasks.*/
import 'package:flutter/material.dart';
import 'package:pomodoro_app/models/task.dart';
import 'package:pomodoro_app/screens/tasks/add_task.dart';
import 'package:pomodoro_app/ui/checkbox.dart';
import 'package:pomodoro_app/ui/drawer.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';

class TaskScreen extends StatefulWidget {
  @override
  _TaskScreenState createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  Map<String, List> _usertasks;
  List tasks = [];
  Task task;
  List userTasks = ["Task 1", "Task 2", "Task 3", "Task 4", "Task 5"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GradientAppBar(
        title: Text('My Tasks'),
        backgroundColorStart: Colors.cyan,
        backgroundColorEnd: Colors.green,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => AddTask()));
            },
          ),
        ],
      ),
      drawer: MyDrawer(),
      body: ReorderableListView(
        padding: EdgeInsets.only(
          top: 40,
        ),
        header: Text("Your Tasks",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            )),
        children: userTasks.isEmpty
            ? LayoutBuilder(builder: (context, constraints) {
                return Column(
                  children: <Widget>[
                    Text(
                      'No Tasks yet!',
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                        height: constraints.maxHeight * 0.6,
                        child: Image.asset(
                          'assets/waiting.png',
                          fit: BoxFit.cover,
                        )),
                  ],
                );
              })
            : userTasks
                .map(
                  (item) => ListTile(
                    leading: Icon(Icons.menu),
                    key: ValueKey("$item"),
                    title: Text("$item"),
                    trailing: MyCheckbox(),
                  ),
                )
                .toList(),
        onReorder: (start, current) {
          setState(() {
            _updateMyTasks(start, current);
          });
        },
      ),
    );
  }

  void _updateMyTasks(start, current) {
    // Dragging the Task from top to bottom.
    if (start < current) {
      int end = current - 1;
      String startItem = userTasks[start];
      int i = 0;
      int local = start;
      do {
        userTasks[local] = userTasks[++local];
        i++;
      } while (i < end - start);
      userTasks[end] = startItem;
    }

    // Dragging the Task from bottom to top.
    else if (start > current) {
      String startItem = userTasks[start];
      for (int i = start; i > current; i--) {
        userTasks[i] = userTasks[i - 1];
      }
      userTasks[current] = startItem;
    }
  }

  // Remove a chosen task.
  void removeTask(TaskScreen task) {
    //_usertasks.removeWhere((k, v) => k == v.indexOf(task.userID));
  }

  // Checks if the user have tasks or not.
  String checkTasks() {
    return _usertasks.isEmpty ? 'You have no tasks try to add more' : null;
  }
}
