import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:pomodoro_app/models/task.dart';
import 'package:pomodoro_app/widgets/comp_list.dart';
import 'package:provider/provider.dart';
import 'package:pomodoro_app/providers/tasks.dart';

// ignore: must_be_immutable
class HistoryScreen extends StatelessWidget {
  static const routeName = '/history';
  Task task;
  //HistoryScreen(this.task);

  @override
  Widget build(BuildContext context) {
    final tasks = Provider.of<TaskProvider>(context).compList;
    return Scaffold(
      appBar: GradientAppBar(
        title: Text('My Completed Tasks'),
        backgroundColorStart: Colors.cyan,
        backgroundColorEnd: Colors.green,
      ),
      body: tasks.length > 0
          ? ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (context, index) {
                return CompItem(tasks[index]);
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
                        'No Completed Tasks yet...',
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
