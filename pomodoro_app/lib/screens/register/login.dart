import 'package:flutter/material.dart';
import 'package:pomodoro_app/providers/auth.dart';
import 'package:provider/provider.dart';
import 'package:pomodoro_app/screens/timer/timer.dart';
import '../register/signup.dart';

class Signin extends StatefulWidget {
  static const routeName = '/login';

  @override
  _State createState() => _State();
}

class _State extends State<Signin> {
  var _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('An Error Occurred!'),
        content: Text(message),
        actions: <Widget>[
          FlatButton(
            child: Text('Okay'),
            onPressed: () {
              Navigator.of(ctx).pop();
            },
          )
        ],
      ),
    );
  }

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
                          'Welcome Login',
                          style: TextStyle(
                              color: Colors.green[300],
                              fontWeight: FontWeight.w500,
                              fontSize: 30),
                        )),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: TextFormField(
                        controller: emailController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'E-mail',
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return value.isEmpty ? "Them Email is Empty" : null;
                          }
                          if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                              .hasMatch(value)) {
                            return 'Please enter a valid Email';
                          }
                          return null;
                        },
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                      child: TextFormField(
                        obscureText: true,
                        controller: passwordController,
                        maxLength: 37,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Password',
                            hintText: "**********"),
                        validator: (String value) {
                          if (value.isEmpty) {
                            return "The Passwrod field is Empty";
                          } else if (value.length < 8) {
                            return "Password must be longer than 8 characters";
                          } else {
                            return null;
                          }
                        },
                      ),
                    ),
                    // FlatButton(
                    // textColor: Colors.green[200],
                    //padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
                    //child: Text('Forgot Password',
                    //  style: TextStyle(fontSize: 40)),

                    // onPressed: () {
                    // Navigator.pushReplacement(
                    //   context,
                    // MaterialPageRoute(
                    //   builder: (context) => ForgetPassword()));
                    //  },
                    //fo
                    //),

                    SizedBox(
                      height: 30.0,
                    ),
                    Container(
                        height: 50,
                        width: 250.00,
                        child: RaisedButton(
                            onPressed: () async {
                              print(emailController.text);
                              print(passwordController.text);

                              if (_formKey.currentState.validate()) {
                                try {
                                  await Provider.of<Auth>(context,
                                          listen: false)
                                      .login(emailController.text,
                                          passwordController.text);
                                  //     Provider.of<Auth>(context, listen: false)
                                  // .getUser(UserModel(
                                  //     email: emailController.text,
                                  // password: passwordController.text));
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => TimerScreen()));
                                } catch (error) {
                                  var errorMessage = 'Authentication failed';
                                  if (error
                                      .toString()
                                      .contains('EMAIL_EXISTS')) {
                                    errorMessage =
                                        'This email address is already in use.';
                                  } else if (error
                                      .toString()
                                      .contains('INVALID_EMAIL')) {
                                    errorMessage =
                                        'This is not a valid email address';
                                  } else if (error
                                      .toString()
                                      .contains('WEAK_PASSWORD')) {
                                    errorMessage = 'This password is too weak.';
                                  } else if (error
                                      .toString()
                                      .contains('EMAIL_NOT_FOUND')) {
                                    errorMessage =
                                        'Could not find a user with that email.';
                                  } else if (error
                                      .toString()
                                      .contains('INVALID_PASSWORD')) {
                                    errorMessage = 'Invalid password.';
                                  }
                                  _showErrorDialog(errorMessage);
                                }
                              }
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
                                    " Login",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 25.0,
                                        fontWeight: FontWeight.w300),
                                  ),
                                )))),

                    Container(
                        child: Row(
                      children: <Widget>[
                        Text("Doesn't have an account?"),
                        FlatButton(
                          textColor: Colors.green[200],
                          child: Text(
                            'Signup',
                            style: TextStyle(fontSize: 20),
                          ),
                          onPressed: () {
                            //signup screen
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Signup()));
                            if (_formKey.currentState.validate()) {
                              Scaffold.of(context).showSnackBar(
                                  SnackBar(content: Text("Process")));
                            }
                          },
                        )
                      ],
                      mainAxisAlignment: MainAxisAlignment.center,
                    )),
                    // Container(
                    //   child: Row(
                    //children: <Widget>[
                    // Text("Do You wanna "),
                    //FlatButton(
                    // textColor: Colors.green[200],
                    //child: Text(
                    //'Change password ?',
                    //style: TextStyle(fontSize: 20),
                    //),
                    //onPressed: () {
                    //signup screen
                    //Navigator.pushReplacement(
                    //  context,
                    //MaterialPageRoute(
                    //  builder: (context) => ChangePassword()));
                    //if (_formKey.currentState.validate()) {
                    //Scaffold.of(context).showSnackBar(
                    //  SnackBar(content: Text("Process")));
                    // }
                    //},
                    // )
                    //],
                    //mainAxisAlignment: MainAxisAlignment.center,
                    // ))
                  ],
                ))));
  }
}
