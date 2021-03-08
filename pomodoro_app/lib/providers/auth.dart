import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:pomodoro_app/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pomodoro_app/screens/Timer/timer.dart';
import 'package:pomodoro_app/screens/profile/profile.dart';
import 'package:pomodoro_app/screens/profile/editprofile.dart';


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
    return null;
  }

  String get userId {
    return _userId;
  }

  bool get isAuth {
    return token != null;
  }

  Future<void> _authenticate(
      String email, String password, String action) async {
    try {
      final url =
          'https://identitytoolkit.googleapis.com/v1/accounts:$action?key=AIzaSyC7ngCPVKFNyDi4Xk2WmPy9f5giP2li2Yc';
      final response = await http.post(
        url,
        body: json.encode(
          {'email': email, 'password': password, 'returnSecureToken': true},
        ),
      );
      final responseData = json.decode(response.body);
      print(responseData['error']);
      if (responseData['error'] != null) {
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
      if (action == "signInWithPassword") {
        var url =
            'https://pomodoro-app-miu-default-rtdb.firebaseio.com/user/$_userId.json';
        http.get(url);
        // print(user.runtimeType);
        // string to json .body
        // todo get the object from the http get request
        // add to user object (var user)
        // user = UserModel()
        // change this user to json (map) and encode it and save in shared prefrences
        // final prefs = await SharedPreferences.getInstance(); SAME
        // prefs.setString('user_data', json.encode(_user.toJson()));

      }
      notifyListeners();
    } catch (error) {
      throw error;
    }
  }



void updateprofile(String fullname , String about , String email , String phone){


}




  void addUser(UserModel user) {
    signup(user.email, user.passWord);
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
          "password": user.passWord,
          "conpassword": user.confirm,
        },
      ),
    );
  }

  Future<void> signup(String email, String password) async {
    return _authenticate(email, password, "signUp");
  }

  Future<void> login(String email, String password) async {
    return _authenticate(email, password, "signInWithPassword");
  }

  Future<void> logout() async {
    _token = null;
    _expiryDate = null;
    _userId = null;

    var user = UserModel(email: null, username: null);
    // var user = null;
    notifyListeners();
  }
}
