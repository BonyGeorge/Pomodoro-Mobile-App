import 'package:flutter/material.dart';
import 'package:pomodoro_app/screens/register/login.dart';
import 'package:pomodoro_app/screens/Profile/profile.dart';

class Change extends StatefulWidget {
  static const routeName = '/change';

  @override
  _State createState() => _State();
}

class _State extends State<Change> {
  var _formKey = GlobalKey<FormState>();
  var newpass;
  TextEditingController userController = TextEditingController();
  TextEditingController oldController = TextEditingController();
  TextEditingController newController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Form(
            key: _formKey,
            child: Padding(
                padding: EdgeInsets.all(10),
                child: ListView(
                  children: <Widget>[
                    Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.all(10),
                        child: Text(
                          'Change Password Page',
                          style: TextStyle(
                              color: Colors.green[300],
                              fontWeight: FontWeight.w500,
                              fontSize: 30),
                        )),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: TextFormField(
                        maxLength: 15,
                        controller: userController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Username',
                        ),
                        validator: (value) {
                          if (value.length < 5) {
                            return "Please enter a valid Username.";
                          } else if (value.isEmpty) {
                            return "The Username is Empty";
                          } else {
                            return null;
                          }
                        },
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                      child: TextFormField(
                        obscureText: true,
                        controller: oldController,
                        maxLength: 37,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Password',
                            hintText: "**********"),
                        validator: (String value) {
                          newpass = value;
                          if (value.isEmpty) {
                            return "The Password field is Empty";
                          } else if (value.length < 8) {
                            return "Password must be longer than 8 characters";
                          } else {
                            return null;
                          }
                        },
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                      child: TextFormField(
                        obscureText: true,
                        controller: newController,
                        maxLength: 37,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'New Password',
                            hintText: "**********"),
                        validator: (String value) {
                          if (value.isEmpty) {
                            return "Please Re-Enter New Password";
                          } else if (value == newpass) {
                            return "Password must be different than above";
                          } else if (value.length < 8) {
                            return "Password must be longer than 8 characters";
                          } else {
                            return null;
                          }
                        },
                      ),
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    Container(
                        height: 50,
                        width: 250.00,
                        child: RaisedButton(
                            onPressed: () {
                              print(userController.text);
                              print(oldController.text);
                              print(newController.text);
                              setState(() {
                                if (_formKey.currentState.validate()) {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Signin()));
                                }
                              });
                            },
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(100.0)),
                            elevation: 0.0,
                            padding: EdgeInsets.all(0.0),
                            child: Ink(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                      begin: Alignment.centerRight,
                                      end: Alignment.centerLeft,
                                      colors: [
                                        Colors.greenAccent,
                                        Colors.lightGreenAccent
                                      ]),
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                child: Container(
                                  constraints: BoxConstraints(
                                      maxWidth: 390.0, minHeight: 550.0),
                                  alignment: Alignment.center,
                                  child: Text(
                                    " Change Password",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 25.0,
                                        fontWeight: FontWeight.w300),
                                  ),
                                )))),
                    SizedBox(
                      height: 20.0,
                    ),
                    Container(
                        height: 50,
                        width: 250.00,
                        child: RaisedButton(
                            onPressed: () {
                              setState(() {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Signin()));
                              });
                            },
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(100.0)),
                            elevation: 0.0,
                            padding: EdgeInsets.all(0.0),
                            child: Ink(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                      begin: Alignment.centerRight,
                                      end: Alignment.centerLeft,
                                      colors: [
                                        Colors.greenAccent,
                                        Colors.lightGreenAccent
                                      ]),
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                child: Container(
                                  constraints: BoxConstraints(
                                      maxWidth: 390.0, minHeight: 550.0),
                                  alignment: Alignment.center,
                                  child: Text(
                                    " Back",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 25.0,
                                        fontWeight: FontWeight.w300),
                                  ),
                                )))),
                    SizedBox(
                      height: 20.0,
                    ),
                    Container(
                        height: 50,
                        width: 250.00,
                        child: RaisedButton(
                            onPressed: () {
                              print(userController.text);
                              print(oldController.text);
                              print(newController.text);
                              setState(() {
                                if (_formKey.currentState.validate()) {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => ProfileApp()));
                                }
                              });
                            },
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(100.0)),
                            elevation: 0.0,
                            padding: EdgeInsets.all(0.0),
                            child: Ink(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                      begin: Alignment.centerRight,
                                      end: Alignment.centerLeft,
                                      colors: [
                                        Colors.greenAccent,
                                        Colors.lightGreenAccent
                                      ]),
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                child: Container(
                                  constraints: BoxConstraints(
                                      maxWidth: 390.0, minHeight: 550.0),
                                  alignment: Alignment.center,
                                  child: Text(
                                    " Get in your Profile",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 25.0,
                                        fontWeight: FontWeight.w300),
                                  ),
                                )))),
                  ],
                ))));
  }
}
