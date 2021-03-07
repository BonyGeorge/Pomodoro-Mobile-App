import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:pomodoro_app/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pomodoro_app/screens/Timer/timer.dart';

class Auth with ChangeNotifier {
  String _token;
  DateTime _expiryDate;
  String _userId;
  var user = UserModel;

  String get token {
    if (_expiryDate != null &&
        _expiryDate.isAfter(DateTime.now()) &&
        _token != null) {
      return _token;
    }
  }

  Future<void> _authenticate(
      String email, String password, String action) async {
    final url =
        'https://identitytoolkit.googleapis.com/v1/accounts:$action?key=AIzaSyC7ngCPVKFNyDi4Xk2WmPy9f5giP2li2Yc';
    final response = await http.post(
      url,
      body: json.encode(
        {'email': email, 'password': password, 'returnSecureToken': true},
      ),
    );
    try {
      final responseData = json.decode(response.body);
      if (responseData['Error'] != null) {
        throw HttpException(responseData['error']['message']);
      }
      _token = responseData['idToken'];
      _userId = responseData['localId'];
      _expiryDate = DateTime.now().add(Duration(
          seconds: int.parse(
        responseData['expiresIn'],
      )));
      print('User ID: $_userId');
      print('Token: $_token');
      print('_expiryDate: $_expiryDate');
      notifyListeners();
    } catch (error) {
      throw error;
    }
  }

  void addUser(UserModel user) {
    signup(user.email, user.passWord);
// _authenticate(user.email, user.password, "signUp");
    var url =
        'https://pomodoro-app-miu-default-rtdb.firebaseio.com/user/$_userId.json';
    http.put(
      url,
      body: json.encode(
        {
          "Fullname": user.fullName,
          "Username": user.userName,
          "email": user.mail,
          "mobile": user.phone,
          // "password": user.passWord,
          // "conpassword": user.confirm,
        },
      ),
    );
  }

  void getUser(UserModel user) {
    login(user.email, user.passWord);
    var url =
        'https://pomodoro-app-miu-default-rtdb.firebaseio.com/user/$_userId.json';
    http.get(url);
  }

  Future<void> signup(String email, String password) async {
    return _authenticate(email, password, "signUp");
  }

  Future<void> login(String email, String password) async {
    return _authenticate(email, password, "signInWithPassword");
  }

  void signOut() async {
    await FirebaseAuth.instance.signOut();
    FirebaseUser user = FirebaseAuth.instance.currentUser;
    runApp(new MaterialApp(
      home: new TimerScreen(),
    ));
  }
}
