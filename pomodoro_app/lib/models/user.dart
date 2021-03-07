//import 'package:sqflite/sqflite.dart';

enum AuthMode { Signup, Signin }

class UserModel {
  String id;
  String fullname;
  String username;
  String mobile;
  String email;
  String password;
  String conpassword;
  // Constructor.
  UserModel({
    this.id,
    this.username,
    this.fullname,
    this.email,
    this.password,
    this.conpassword,
    this.mobile,
  });

  // Setters & Getters.
  String get iD => id;

  String get userName {
    return username;
  }

  String get passWord {
    return password;
  }

  String get confirm {
    return conpassword;
  }

  String get fullName {
    return fullname;
  }

  String get phone {
    return mobile;
  }

  String get mail {
    return email;
  }
}
