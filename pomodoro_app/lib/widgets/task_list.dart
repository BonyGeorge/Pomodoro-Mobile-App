// Widget responsible for displaying tasks in the form of a list.

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pomodoro_app/widgets/task_name.dart';
import 'package:pomodoro_app/providers/tasks.dart';
import 'package:pomodoro_app/widgets/add_task.dart';
import 'package:pomodoro_app/models/task.dart';

class ListItem extends StatefulWidget {
  final Task task;
  ListItem(this.task);

  @override
  _ListItemState createState() => _ListItemState();
}

class _ListItemState extends State<ListItem> {
  @override
  Widget build(BuildContext context) {
    void _checkItem() {
      setState(() {
        Provider.of<TaskProvider>(context, listen: false)
            .completeTask(widget.task.id);
        Provider.of<TaskProvider>(context, listen: false)
            .removeTask(widget.task.id);
      });
    }

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
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              'Delete',
              style: TextStyle(
                color: Theme.of(context).errorColor,
                fontFamily: 'Lato',
                fontSize: 10,
              ),
            ),
            SizedBox(width: 5),
            Icon(
              Icons.delete,
              color: Theme.of(context).errorColor,
              size: 20,
            ),
          ],
        ),
      ),
      child: GestureDetector(
        onTap: _checkItem,
        child: Container(
          height: 65,
          child: Card(
            elevation: 10,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Checkbox(
                      value: widget.task.isCompleted,
                      onChanged: (_) => _checkItem(),
                    ),
                    ItemText(
                      widget.task.isCompleted,
                      widget.task.title,
                      widget.task.dueDate,
                      widget.task.dueTime,
                    ),
                  ],
                ),
                IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (_) => AddNewTask(
                        id: widget.task.id,
                        isEditMode: true,
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
