// The Tasks Page.
/* Here is all of the user daily tasks.*/
import 'package:flutter/material.dart';
import 'package:pomodoro_app/screens/projects/ProjectTask.dart';
import 'package:pomodoro_app/ui/checkbox.dart';
import 'package:pomodoro_app/ui/drawer.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';

class ProjectT extends StatefulWidget {
  @override
  _TaskState createState() => _TaskState();
}

class _TaskState extends State<ProjectT> {
  List userTasks = ["Task 1", "Task 2", "Task 3", "Task 4"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GradientAppBar(
        title: Text('Project1'),
        backgroundColorStart: Colors.cyan,
        backgroundColorEnd: Colors.green,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => AddPTask()));
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
        children: userTasks
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
}
