import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

enum AuthMode { Signup, Signin }

class UserModel {
  String token;
  String id;
  String fullname;
  String username;
  String mobile;
  String email;
  String password;
  String conpassword;
  // Constructor.
  UserModel({
    token,
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
  bool get isAuth {
    return token != null;
  }

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
