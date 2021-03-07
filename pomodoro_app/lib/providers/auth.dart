import 'dart:async';
import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:pomodoro_app/models/user.dart';
import 'package:pomodoro_app/screens/Timer/timer.dart';
import 'package:pomodoro_app/screens/profile/profile.dart';
import 'package:pomodoro_app/screens/profile/editprofile.dart';


class Auth with ChangeNotifier {
  String token;
  var user = UserModel;

  String get userToken {
    return token;
  }

  bool get isAuth {
    return userToken != null;
  }

  Future<bool> register(String email, String password) async {
    try {
      FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: password, password: password);
      print(FirebaseAuth.instance.currentUser.uid);
      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
      return false;
    } catch (e) {
      print(e.toString());
      return false;
    }
  }



void updateprofile(String fullname , String about , String email , String phone){


}




  void addUser(UserModel user) {
    const url =
        'https://pomodoro-app-miu-default-rtdb.firebaseio.com/user.json';
    http.post(url,
        body: json.encode({
          "Fullname": user.fullName,
          "Username": user.userName,
          "email": user.mail,
          "mobile": user.phone,
          "password": user.passWord,
          "conpassword": user.confirm,
        }));
    // final newUser = UserModel(
    // fullname: user.fullname,
    // username: user.username,
    //  email: user.email,
    //  mobile: user.mobile,
    //   password: user.password,
    // conpassword: user.conpassword,
    // );

    void signOut() async {
      await FirebaseAuth.instance.signOut();
      FirebaseUser user = FirebaseAuth.instance.currentUser;
      runApp(new MaterialApp(
        home: new TimerScreen(),
      ));
    }
  }
}
