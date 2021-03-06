// Add & Edit Project.

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:pomodoro_app/models/project.dart';
import 'package:pomodoro_app/providers/projects.dart';

class AddNewProject extends StatefulWidget {
  final String id;
  final String title;
  final bool isEditMode;

  AddNewProject({
    this.id,
    this.title,
    this.isEditMode,
  });

  @override
  _AddNewProjectState createState() => _AddNewProjectState();
}

class _AddNewProjectState extends State<AddNewProject> {
  Project project;
  TimeOfDay _selectedTime;
  DateTime _selectedDate;
  String _inputDescription;
  final _formKey = GlobalKey<FormState>();

  void _pickUserDueDate() {
    showDatePicker(
            context: context,
            initialDate: widget.isEditMode ? _selectedDate : DateTime.now(),
            firstDate: DateTime(2020),
            lastDate: DateTime(2030))
        .then((date) {
      if (date == null) {
        return;
      }
      date = date;
      setState(() {
        _selectedDate = date;
      });
    });
  }

  void _pickUserDueTime() {
    showTimePicker(
      context: context,
      initialTime: widget.isEditMode ? _selectedTime : TimeOfDay.now(),
    ).then((time) {
      if (time == null) {
        return;
      }
      setState(() {
        _selectedTime = time;
      });
    });
  }

  void _validateForm() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      if (_selectedDate == null && _selectedTime != null) {
        _selectedDate = DateTime.now();
      }
      if (!widget.isEditMode) {
        Provider.of<ProjectProvider>(context, listen: false).createNewProject(
          Project(
            id: DateTime.now().toString(),
            title: _inputDescription,
            dueDate: _selectedDate,
            dueTime: _selectedTime,
          ),
        );
      } else {
        Provider.of<ProjectProvider>(context, listen: false).editProject(
          Project(
            id: project.id,
            title: _inputDescription,
            dueDate: _selectedDate,
            dueTime: _selectedTime,
          ),
        );
      }
      Navigator.of(context).pop();
    }
  }

  @override
  void initState() {
    if (widget.isEditMode) {
      project = Provider.of<ProjectProvider>(context, listen: false)
          .getById(widget.id);
      _selectedDate = project.dueDate;
      _selectedTime = project.dueTime;
      _inputDescription = project.title;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('Project Title',
                  style: Theme.of(context).textTheme.subtitle1),
              TextFormField(
                initialValue:
                    _inputDescription == null ? null : _inputDescription,
                decoration: InputDecoration(
                  hintText: 'Describe your project.',
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter some text.';
                  }
                  return null;
                },
                onSaved: (value) {
                  _inputDescription = value;
                },
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 20,
              ),
              Text('Due date', style: Theme.of(context).textTheme.subtitle1),
              TextFormField(
                onTap: () {
                  _pickUserDueDate();
                },
                readOnly: true,
                decoration: InputDecoration(
                  hintText: _selectedDate == null
                      ? 'Provide your due date'
                      : DateFormat.yMMMd().format(_selectedDate).toString(),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text('Due time', style: Theme.of(context).textTheme.subtitle1),
              TextFormField(
                onTap: () {
                  _pickUserDueTime();
                },
                readOnly: true,
                decoration: InputDecoration(
                  hintText: _selectedTime == null
                      ? 'Provide your due time'
                      : _selectedTime.format(context),
                ),
              ),
              Container(
                alignment: Alignment.center,
                child: FlatButton(
                  child: Text(
                    !widget.isEditMode ? 'Add New Project' : 'Edit Project',
                    style: TextStyle(
                        color: Theme.of(context).accentColor,
                        fontFamily: 'Lato',
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  onPressed: () {
                    _validateForm();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
