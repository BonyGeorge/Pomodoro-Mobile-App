import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pomodoro_app/models/task.dart';

class Project {
  String id;
  String userID;
  String title;
  String desc;
  DateTime dueDate;
  TimeOfDay dueTime;
  bool isCompleted;
  final List<Project> task;

  // Constructor.
  Project({
    @required this.id,
    this.userID,
    @required this.title,
    this.desc,
    this.dueDate,
    this.dueTime,
    this.isCompleted = false,
    this.task,
  });

  // Setters & Getters.
  String get iD => id;
  String get userId => userID;

  set projectTitle(String title) => this.title = title;
  String get projectTitle => title;

  set description(String desc) => this.desc = desc;
  String get taskdesc => desc;

  set endDate(DateTime dueDate) => this.dueDate = dueDate;
  DateTime get endDate => dueDate;

  set endTime(TimeOfDay dueTime) => this.dueTime = dueTime;
  TimeOfDay get endTime => dueTime;

  set compelted(bool isCompleted) => this.isCompleted = isCompleted;
  bool get completed => isCompleted;
}
