import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:pomodoro_app/models/user.dart';

class Auth with ChangeNotifier {
  String _token;
  DateTime _expiryDate;
  String _userId;
  var user = UserModel;

  String get token {
    if (_expiryDate != null &&
        _expiryDate.isAfter(DateTime.now()) &&
        token != null) {
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

  Future<void> signup(String email, String password) async {
    return _authenticate(email, password, "signUp");
  }

  Future<void> login(String email, String password) async {
    return _authenticate(email, password, "signInWithPassword");
  }

  // TODO: Check Logout with Nour.
  Future<void> logout() async {
    _token = null;
    _expiryDate = null;
    _userId = null;

    var user = UserModel(email: null, username: null);
    notifyListeners();
  }
}
