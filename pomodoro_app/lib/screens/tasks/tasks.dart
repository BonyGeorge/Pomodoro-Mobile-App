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
  static const routeName = '/tasks';

  Future _tasks(BuildContext context) async {
    await Provider.of<TaskProvider>(context, listen: false)
        .fetchAndSetTasks(filterByUser: true);
  }

  @override
  Widget build(BuildContext context) {
    print('Task build');
    return Scaffold(
        appBar: GradientAppBar(
          title: Text('My Tasks'),
          backgroundColorStart: Colors.cyan,
          backgroundColorEnd: Colors.green,
          centerTitle: true,
          actions: [
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
        body: FutureBuilder(
          future: Provider.of<TaskProvider>(context, listen: false)
              .fetchAndSetTasks(filterByUser: true),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else {
              final taskList = Provider.of<TaskProvider>(context).itemsList;
              print(taskList.length);
              if (taskList.length == 0) {
                return LayoutBuilder(
                  builder: (ctx, constraints) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
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
                );
              } else {
                return ListView.builder(
                  itemCount: taskList.length,
                  itemBuilder: (context, index) {
                    return ListItem(taskList[index]);
                  },
                );
              }
            }
          },
        ));
  }
}
