import 'package:flutter/foundation.dart';

class Project {
  String id;
  String userID;
  String title;
  String desc;

  // Constructor.
  Project({
    this.id,
    @required this.userID,
    @required this.title,
    this.desc,
  });

  // Setters & Getters.
  String get iD => id;
  String get userId => userID;

  set taskTitle(String title) => this.title = title;
  String get taskTitle => title;

  set description(String desc) => this.desc = desc;
  String get taskdesc => desc;
}
