import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Task {
  String id;
  String userID;
  String title;
  DateTime dueDate;
  TimeOfDay dueTime;
  bool isCompleted;

  // Constructor.
  Task({
    @required this.id,
    this.userID,
    @required this.title,
    this.dueDate,
    this.dueTime,
    this.isCompleted = false,
  });

  // Setters & Getters.
  String get iD => id;
  String get userId => userID;

  set taskTitle(String title) => this.title = title;
  String get taskTitle => title;

  set compelted(bool isCompleted) => this.isCompleted = isCompleted;
  bool get completed => isCompleted;

  set endTime(TimeOfDay dueTime) => this.dueTime = dueTime;
  TimeOfDay get endTime => dueTime;

  set endDate(DateTime dueDate) => this.dueDate = dueDate;
  DateTime get endDate => dueDate;
}
