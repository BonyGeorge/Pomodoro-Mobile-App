// The Tasks Page.
/* Here is all of the user daily tasks.*/
import 'package:flutter/material.dart';
import 'package:pomodoro_app/screens/tasks/tasks_history.dart';
import 'package:pomodoro_app/widgets/drawer.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:provider/provider.dart';
import 'package:pomodoro_app/providers/tasks.dart';
import 'package:pomodoro_app/widgets/task_list.dart';
import 'package:pomodoro_app/widgets/add_task.dart';
import 'package:pomodoro_app/widgets/badge.dart';

class TaskScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final taskList = Provider.of<TaskProvider>(context).itemsList;
    //final task = Provider.of<TaskProvider>(context);
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: GradientAppBar(
        title: Text('My Tasks'),
        backgroundColorStart: Colors.cyan,
        backgroundColorEnd: Colors.green,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (_) => AddNewTask(isEditMode: false),
              );
            },
          ),
          Consumer<TaskProvider>(
            builder: (_, task, child) => Badge(
              child: child,
              value: task.itemCount.toString(),
            ),
            child: IconButton(
              icon: Icon(Icons.assignment_turned_in_rounded),
              onPressed: () {
                Navigator.of(context).pushNamed(HistoryScreen.routeName);
              },
            ),
          ),
        ],
      ),
      drawer: MyDrawer(),
      body: taskList.length > 0
          ? ListView.builder(
              itemCount: taskList.length,
              itemBuilder: (context, index) {
                return ListItem(taskList[index]);
              },
            )
          : LayoutBuilder(
              builder: (ctx, constraints) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        height: constraints.maxHeight * 0.5,
                        child: Image.asset('assets/images/nodata.png',
                            fit: BoxFit.cover),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        'No tasks added yet...',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }
}
