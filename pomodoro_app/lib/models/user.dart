import 'package:flutter/foundation.dart';
import 'package:pomodoro_app/models/task.dart';

class User {
  String id;
  String name;
  String email;
  String password;
  String mobile;

  Map<String, Task> _tasks;
  Task task;

  // Constructor.
  User({
    this.id,
    @required this.name,
    @required this.email,
    @required this.password,
    @required this.mobile,
  });

  // Setters & Getters.
  String get iD => id;

  set userName(String name) => this.name = name;
  String get userName => name;

  set userEmail(String email) => this.email = email;
  String get userEmail => email;

  set userMobile(String mobile) => this.mobile = mobile;
  String get userMobile => mobile;

  set userPassword(String password) => this.password = password;

  // User adds a task.
  void addTask(
    String userID,
    String title,
    String desc,
    DateTime startDate,
    DateTime dueDate,
    bool isCompleted,
  ) {
    task = Task(
        userID: userID,
        title: title,
        startDate: startDate,
        dueDate: dueDate,
        isCompleted: isCompleted);

    _tasks.putIfAbsent(userID, () => task);
  }

  // Remove a chosen task.
  void removeTask(Task task) {
    _tasks.removeWhere((k, v) => k == v.userID);
  }

  // Checks if the user have tasks or not.
  String checkTasks() {
    return _tasks.isEmpty ? 'You have no tasks try to add more' : null;
  }
}
