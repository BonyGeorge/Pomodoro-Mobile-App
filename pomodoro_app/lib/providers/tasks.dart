// The Tasks Provider.

import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pomodoro_app/models/task.dart';
import 'package:http/http.dart' as http;
import 'package:pomodoro_app/providers/auth.dart';

class TaskProvider with ChangeNotifier {
  static const baseUrl =
      'https://pomodoro-app-miu-default-rtdb.firebaseio.com/';
  String authToken;
  String userId;

  TaskProvider(this.authToken, this.userId, this._toDoList);
  List<Task> _toDoList = [
    /* Task(
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
    ),*/
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

  void removeHistTask(String id) {
    _completedList.removeWhere((task) => task.id == id);
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

  Future<void> fetchAndSetTasks({bool filterByUser = true}) async {
    final filterString = filterByUser ? 'orderBy="ownerId"&equalTo=1' : '';

    var url = '$baseUrl/Tasks.json?$filterString';
    try {
      final response = await http.get(url);
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      if (extractedData == null) {
        return;
      }
      print(response.body);
      final List<Task> loadedTasks = [];
      extractedData.forEach((taskid, task) {
        loadedTasks.add(Task(
          id: taskid,
          title: task['title'],
          /*dueDate: DateTime.parse(task['description']),
          dueTime: TimeOfDay.fromDateTime(task['dueTime']),*/
        ));
      });
      _toDoList = loadedTasks;
      print("Task has been added");
      notifyListeners();
    } catch (error) {
      throw (error);
    }
  }

  void receiveToken(Auth auth, List<Task> tasks) {
    authToken = auth.token;
    userId = auth.userId;
    print('Tasks received Token for user with Id: $userId');
    _toDoList = tasks;
  }

  Future<void> addTask(Task task) async {
    final url = '$baseUrl/Tasks.json?auth=$authToken';
    try {
      final response = await http.post(
        url,
        body: json.encode({
          'title': task.title,
          'dueTime': task.dueTime,
          'dueDate': task.dueDate,
          'ownerId': userId,
        }),
      );
      final newTask = Task(
        title: task.title,
        dueDate: task.dueDate,
        dueTime: task.dueTime,
        id: json.decode(response.body)['name'],
      );
      _toDoList.add(newTask);
      print("Task is added of id =  $newTask.id");
      notifyListeners();
    } catch (error) {
      print(error);
      throw error;
    }
  }
}
