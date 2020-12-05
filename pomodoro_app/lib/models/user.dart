import 'package:flutter/foundation.dart';

class User {
  String id;
  String name;
  String email;
  String password;
  String mobile;

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
}
