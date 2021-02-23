// The Tasks Page.
/* Here is all of the user daily tasks.*/
import 'package:flutter/material.dart';
import 'package:pomodoro_app/screens/projects/Project1.dart';
import 'package:pomodoro_app/screens/projects/add_project.dart';
//import 'package:pomodoro_app/widgets/checkbox.dart';
import 'package:pomodoro_app/widgets/drawer.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';

class Project extends StatefulWidget {
  static const routeName = '/projects';

  @override
  _ProjectState createState() => _ProjectState();
}

class _ProjectState extends State<Project> {
  List userprojects = ["Project 1", "Project 2"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GradientAppBar(
        title: Text('My Projects'),
        backgroundColorStart: Colors.cyan,
        backgroundColorEnd: Colors.green,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => AddProject()));
            },
          ),
        ],
      ),
      drawer: MyDrawer(),
      body: ReorderableListView(
        padding: EdgeInsets.only(
          top: 40,
        ),
        header: Text("Your Projects",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            )),
        children: userprojects
            .map(
              (item) => ListTile(
                key: ValueKey("$item"),
                title: Text("$item"),
                // trailing: MyCheckbox(),
              ),
            )
            .toList(),
        onReorder: (start, current) {
          setState(() {
            _updateMyProjects(start, current);
          });
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => ProjectT()));
        },
        label: Text('View'),
        icon: Icon(Icons.search),
        backgroundColor: Colors.green,
      ),
    );
  }

  void _updateMyProjects(start, current) {
    // Dragging the Task from top to bottom.
    if (start < current) {
      int end = current - 1;
      String startItem = userprojects[start];
      int i = 0;
      int local = start;
      do {
        userprojects[local] = userprojects[++local];
        i++;
      } while (i < end - start);
      userprojects[end] = startItem;
    }

    // Dragging the Task from bottom to top.
    else if (start > current) {
      String startItem = userprojects[start];
      for (int i = start; i > current; i--) {
        userprojects[i] = userprojects[i - 1];
      }
      userprojects[current] = startItem;
    }
  }
}
