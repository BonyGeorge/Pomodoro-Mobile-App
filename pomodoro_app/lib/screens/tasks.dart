// The Tasks Page.
/* Here is all of the user daily tasks.*/
import 'package:flutter/material.dart';
import 'package:pomodoro_app/ui/drawer.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';

class Tasks extends StatefulWidget {
  Tasks({Key key}) : super(key: key);

  @override
  _TasksState createState() => _TasksState();
}

class _TasksState extends State<Tasks> {
  List _userTasks = ["Task 1", "Task 2", "Task 3", "Task 4", "Task 5"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GradientAppBar(
        title: Text('Pomodoro App'),
        backgroundColorStart: Colors.cyan,
        backgroundColorEnd: Colors.green,
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
        children: _userTasks
            .map((item) => ListTile(
                  leading: Icon(Icons.menu),
                  key: ValueKey("$item"),
                  title: Text("$item"),
                ))
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
      String startItem = _userTasks[start];
      int i = 0;
      int local = start;
      do {
        _userTasks[local] = _userTasks[++local];
        i++;
      } while (i < end - start);
      _userTasks[end] = startItem;
    }

    // Dragging the Task from bottom to top.
    else if (start > current) {
      String startItem = _userTasks[start];
      for (int i = start; i > current; i--) {
        _userTasks[i] = _userTasks[i - 1];
      }
      _userTasks[current] = startItem;
    }
  }
}
