// The projects Provider.

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pomodoro_app/models/project.dart';
import 'package:pomodoro_app/models/task.dart';

class ProjectProvider with ChangeNotifier {
  final List<Project> _projectList = [
    Project(
      id: 'Project#1',
      title: 'Project 1',
      //task: List["_projectTasks"],
      dueDate: DateTime.now(),
      dueTime: TimeOfDay.now(),
      task: [],
    ),
    Project(
      id: 'Project#2',
      title: 'Project 2',
      dueDate: DateTime.now(),
      dueTime: TimeOfDay.now(),
    ),
    Project(
      id: 'Project#3',
      title: 'Project 3',
      dueDate: DateTime.now(),
      dueTime: TimeOfDay.now(),
    ),
  ];

  List<Task> _projectTasks = [
    Task(
      id: 'PT#1',
      title: 'P Task 1',
      dueDate: DateTime.now(),
      dueTime: TimeOfDay.now(),
    ),
    Task(
      id: 'PT#2',
      title: 'P Task 2',
      dueDate: DateTime.now(),
      dueTime: TimeOfDay.now(),
    ),
    Task(
      id: 'PT#3',
      title: 'P Task 3',
      dueDate: DateTime.now(),
      dueTime: TimeOfDay.now(),
    ),
  ];

  List<Project> get projectsList {
    return [..._projectList];
  }

  List<Task> get projectsTasks {
    return [..._projectTasks];
  }

  Project getById(String id) {
    return _projectList.firstWhere((project) => project.id == id);
  }

  Task getByTaskId(String id) {
    return _projectTasks.firstWhere((task) => task.id == id);
  }

  void createNewProject(Project project) {
    final newProject = Project(
      id: project.id,
      title: project.projectTitle,
      dueDate: project.dueDate,
      dueTime: project.dueTime,
    );
    _projectList.add(newProject);
    notifyListeners();
  }

  void createNewTaskProject(Task task) {
    final newTaskProject = Task(
      id: task.id,
      title: task.taskTitle,
      dueDate: task.dueDate,
      dueTime: task.dueTime,
    );
    _projectTasks.add(newTaskProject);
    notifyListeners();
  }

  void editProject(Project project) {
    removeProject(project.id);
    createNewProject(project);
  }

  void editTaskProject(Task task) {
    removeTaskProject(task.id);
    createNewTaskProject(task);
  }

  void removeProject(String id) {
    _projectList.removeWhere((project) => project.id == id);
    notifyListeners();
  }

  void removeTaskProject(String id) {
    _projectTasks.removeWhere((task) => task.id == id);
    notifyListeners();
  }

  void fill(String id) {
    var index = int.parse(id);
    _projectList[index].task.addAll(_projectTasks);
  }
}