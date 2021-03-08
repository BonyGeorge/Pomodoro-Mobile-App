import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:pomodoro_app/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pomodoro_app/screens/Timer/timer.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Auth with ChangeNotifier {
  String _token;
  DateTime _expiryDate;
  String _userId;
  UserModel user;

  String get token {
    if (_expiryDate != null &&
        _expiryDate.isAfter(DateTime.now()) &&
        _token != null) {
      return _token;
    }
    return null;
  }

  bool get isAuth {
    return token != null;
  }

  Future<void> _authenticate(String email, String password, String action,
      {UserModel user}) async {
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

        var res = await http.get(url);

        final responseData = jsonDecode(res.body);
        if (responseData['error'] != null) {
          throw HttpException(responseData['error']['message']);
        }
        user = UserModel(
            password: responseData['password'], email: responseData['email']);
        print(responseData);
        final prefs = await SharedPreferences.getInstance();
        prefs.setString(
            'user_data',
            json.encode({
              "Id": _userId,
              "Fullname": user.fullName,
              "Username": user.userName,
              "email": user.mail,
              "mobile": user.phone,
              "password": user.passWord,
              "conpassword": user.confirm
            }));
      } else {
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
      // print(user.runtimeType);
      // string to json .body
      // todo get the object from the http get request
      // add to user object (var user)
      // user = UserModel() //16

      // change this user to json (map) and encode it and save in shared prefrences
      // final prefs = await SharedPreferences.getInstance(); SAME
      // prefs.setString('user_data', json.encode(_user.toJson()));

      notifyListeners();
    } catch (error) {
      throw error;
    }
  }

  Future<void> signup(UserModel user, String password) async {
    return _authenticate(user.email, password, "signUp", user: user);
  }

  Future<void> login(String email, String password) async {
    return _authenticate(email, password, "signInWithPassword");
  }

  Future<bool> autoLogin() async {
    if (isAuth) return true;
    // return Future.value(false);
    final prefs = await SharedPreferences.getInstance();
    print("prefs.containsKey('user_data') ${prefs.containsKey('user_data')}");
    if (!prefs.containsKey('user_data')) {
      return false;
    }
    final savedUserData =
        json.decode(prefs.getString('user_data')) as Map<String, dynamic>;

    print("//Auto Login $savedUserData");
    try {
      user = UserModel(
        id: savedUserData['Id'],
        email: savedUserData['email'],
        fullname: savedUserData['Fullname'],
        mobile: savedUserData['mobile'],
      );
      notifyListeners();
    } on Exception catch (e) {
      print(e.toString());
    }
    return true;
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('user_data', null);

    _token = null;
    _expiryDate = null;
    _userId = null;

    var user = UserModel(email: null, username: null);
    // var user = null;
    notifyListeners();
  }
}
