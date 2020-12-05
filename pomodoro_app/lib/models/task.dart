import 'package:flutter/foundation.dart';

class Task {
  String id;
  String userID;
  String title;
  String desc;
  DateTime startDate;
  DateTime dueDate;
  bool isCompleted;

  // Constructor.
  Task();
  Task.fillConst({
    this.id,
    @required this.userID,
    @required this.title,
    this.desc,
    @required this.startDate,
    @required this.dueDate,
    @required this.isCompleted,
  });
  // Setters & Getters.
  String get iD => id;
  String get userId => userID;

  set taskTitle(String title) => this.title = title;
  String get taskTitle => title;

  set description(String desc) => this.desc = desc;
  String get taskdesc => desc;

  set compelted(bool isCompleted) => this.isCompleted = isCompleted;
  bool get completed => isCompleted;

  set beginDate(DateTime startDate) => this.startDate = startDate;
  DateTime get beginDate => startDate;

  set endDate(DateTime dueDate) => this.dueDate = dueDate;
  DateTime get endDate => dueDate;
}
