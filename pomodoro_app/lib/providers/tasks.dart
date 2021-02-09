// The Tasks Provider.

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pomodoro_app/models/task.dart';

class TaskProvider with ChangeNotifier {
  final List<Task> _toDoList = [
    Task(
      id: 'task#1',
      title: 'Task 1',
      dueDate: DateTime.now(),
      dueTime: TimeOfDay.now(),
    ),
    Task(
      id: 'task#2',
      title: 'Task 2',
      dueDate: DateTime.now(),
      dueTime: TimeOfDay.now(),
    ),
    Task(
      id: 'task#3',
      title: 'Task 3',
      dueDate: DateTime.now(),
      dueTime: TimeOfDay.now(),
    ),
    Task(
      id: 'task#4',
      title: 'Task 4',
      dueDate: DateTime.now(),
      dueTime: TimeOfDay.now(),
    ),
  ];

  List<Task> _completedList = [
    Task(
      id: 'comptask#1',
      title: 'Completed Task 1',
      dueDate: DateTime.now(),
      dueTime: TimeOfDay.now(),
    ),
    Task(
      id: 'comptask#2',
      title: 'Completed Task 2',
      dueDate: DateTime.now(),
      dueTime: TimeOfDay.now(),
    ),
    Task(
      id: 'compttask#3',
      title: 'Completed Task 3',
      dueDate: DateTime.now(),
      dueTime: TimeOfDay.now(),
    ),
  ];

  List<Task> get itemsList {
    return [..._toDoList];
  }

  List<Task> get compList {
    return [..._completedList];
  }

  Task getById(String id) {
    return _toDoList.firstWhere((task) => task.id == id);
  }

  void createNewTask(Task task) {
    final newTask = Task(
      id: task.id,
      title: task.taskTitle,
      dueDate: task.dueDate,
      dueTime: task.dueTime,
    );
    _toDoList.add(newTask);
    notifyListeners();
  }

  void editTask(Task task) {
    removeTask(task.id);
    createNewTask(task);
  }

  void removeTask(String id) {
    _toDoList.removeWhere((task) => task.id == id);
    notifyListeners();
  }

  void completeTask(String id) {
    int index = _toDoList.indexWhere((task) => task.id == id);
    _toDoList[index].isCompleted = !_toDoList[index].isCompleted;
    _completedList.add(_toDoList[index]);
    _toDoList.remove(index);
  }

  int get itemCount {
    return _completedList == null ? 0 : _completedList.length;
  }
}
