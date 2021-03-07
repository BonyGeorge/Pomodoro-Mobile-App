// Widget responsible for displaying tasks in the form of a list.

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pomodoro_app/providers/projects.dart';
import 'package:pomodoro_app/widgets/task_name.dart';
import 'package:pomodoro_app/screens/projects/ProjectTask.dart';
import 'package:pomodoro_app/widgets/add_edit_project.dart';
import 'package:pomodoro_app/models/project.dart';

class ProjectItem extends StatefulWidget {
  final Project project;
  ProjectItem(this.project);

  @override
  _ProjectItemState createState() => _ProjectItemState();
}

class _ProjectItemState extends State<ProjectItem> {
  @override
  Widget build(BuildContext context) {
    void _checkItem() {
      setState(() {
        Navigator.of(context).pushNamed(AddPTask.routeName);
      });
    }

    void _deleteProject() {
      setState(() {
        Provider.of<ProjectProvider>(context, listen: false)
            .removeProject(widget.project.id);
      });
    }

    return Dismissible(
      key: ValueKey(widget.project.id),
      direction: DismissDirection.endToStart,
      onDismissed: (_) {
        _deleteProject();
      },
      background: Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              'Delete project',
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
                      value: widget.project.isCompleted,
                      onChanged: (_) => _checkItem(),
                    ),
                    ItemText(
                      widget.project.isCompleted,
                      widget.project.title,
                      widget.project.dueDate,
                      widget.project.dueTime,
                    ),
                  ],
                ),
                IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (_) => AddNewProject(
                        id: widget.project.id,
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
