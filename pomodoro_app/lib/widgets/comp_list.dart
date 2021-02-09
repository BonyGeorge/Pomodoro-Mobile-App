// Widget responsible for displaying tasks in the form of a list.
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pomodoro_app/widgets/task_name.dart';
import 'package:pomodoro_app/providers/tasks.dart';
import 'package:pomodoro_app/models/task.dart';

class CompItem extends StatefulWidget {
  final Task task;
  CompItem(this.task);

  @override
  _CompItemState createState() => _CompItemState();
}

class _CompItemState extends State<CompItem> {
  @override
  Widget build(BuildContext context) {
    void _deleteTask() {
      setState(() {
        Provider.of<TaskProvider>(context, listen: false)
            .removeTask(widget.task.id);
      });
    }

    return Dismissible(
      key: ValueKey(widget.task.id),
      direction: DismissDirection.endToStart,
      onDismissed: (_) {
        _deleteTask();
      },
      background: Container(
        color: Theme.of(context).errorColor,
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              'Delete',
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Lato',
                fontSize: 10,
              ),
            ),
            SizedBox(width: 5),
            Icon(
              Icons.delete,
              color: Colors.white,
              size: 20,
            ),
          ],
        ),
      ),
      child: Container(
        height: 65,
        child: Card(
          elevation: 10,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  ItemText(
                    widget.task.isCompleted,
                    widget.task.title,
                    widget.task.dueDate,
                    widget.task.dueTime,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
