// The projects Provider.

import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pomodoro_app/models/project.dart';
import 'package:pomodoro_app/models/task.dart';
import 'package:pomodoro_app/providers/auth.dart';
import 'package:pomodoro_app/widgets/pt_list.dart';

class ProjectProvider with ChangeNotifier {
  String authToken;
  String userId;
  ProjectProvider(this.authToken, this.userId, this._projectList);

  List<Project> _projectList = [
    // Project(
    //   id: 'Project#1',
    //   title: 'Project 1',
    //   //task: List["_projectTasks"],
    //   dueDate: DateTime.now(),
    //   dueTime: TimeOfDay.now(),
    //   task: [],
    // ),
    // Project(
    //   id: 'Project#2',
    //   title: 'Project 2',
    //   dueDate: DateTime.now(),
    //   dueTime: TimeOfDay.now(),
    // ),
    // Project(
    //   id: 'Project#3',
    //   title: 'Project 3',
    //   dueDate: DateTime.now(),
    //   dueTime: TimeOfDay.now(),
    // ),
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

  //fetch function

  Future<void> fetchAndSetProjects({bool filterByUser = true}) async {
    final filterString = filterByUser ? 'orderBy="ownerId"&equalTo=1' : '';

    final url =
        'https://pomodoro-app-miu-default-rtdb.firebaseio.com/Projects.json';
    try {
      final response = await http.get(url);
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      if (extractedData == null) {
        return;
      }
      print(response.body);
      final List<Project> loadedProjects = [];
      extractedData.forEach((projectid, project) {
        loadedProjects.add(Project(
          id: projectid,
          title: project['title'],
          task: (project['task'] as List<dynamic>)
              .map(
                (task) => Task(
                  id: task['id'],
                  title: task['title'],
                ),
              )
              .toList(),
        ));
      });
      _projectList = loadedProjects.reversed.toList();
      print("Project added");
      notifyListeners();
    } catch (error) {
      throw (error);
    }
  }
  //recive token function

  void receiveToken(Auth auth, List<Project> project) {
    authToken = auth.token;
    userId = auth.userId;
    print('Projects received Token for user with Id: $userId');
    _projectList = project;
  }

  //add function el gdedaa

  Future<void> addProject(List<Task> tasks, Project project) async {
    final url =
        'https://pomodoro-app-miu-default-rtdb.firebaseio.com/Projects.json';
    try {
      final response = await http.post(
        url,
        body: json.encode({
          'title': project.title,
          'dueTime': project.dueTime,
          'dueDate': project.dueDate,
          'ownerId': userId,
          'tasks': tasks
              .map((t) => {
                    'id': t.id,
                    'title': t.title,
                  })
              .toList(),
        }),
      );
      final newProject = Project(
        title: project.title,
        dueDate: project.dueDate,
        dueTime: project.dueTime,
        id: json.decode(response.body)['name'],
        task: tasks,
      );
      _projectList.add(newProject);
      //print("Project is added of id =  $newTask.id");
      notifyListeners();
    } catch (error) {
      print(error);
      throw error;
    }
  }
}

//Add el adema
/*
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
*/

//add task el ademaa
/*
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
*/

//edit el ademaa
/*
  void editProject(Project project) {
    removeProject(project.id);
    createNewProject(project);
  }
*/

//edit task el ademaa
/*
  void editTaskProject(Task task) {
    removeTaskProject(task.id);
    createNewTaskProject(task);
  }
*/

//delete project el adema
/*
  void removeProject(String id) {
    _projectList.removeWhere((project) => project.id == id);
    notifyListeners();
  }
*/

//delete task el adema
/*
  void removeTaskProject(String id) {
    _projectTasks.removeWhere((task) => task.id == id);
    notifyListeners();
  }
*/

//delete task el adema
/*

  void fill(String id) {
    var index = int.parse(id);
    _projectList[index].task.addAll(_projectTasks);
  }
*/
