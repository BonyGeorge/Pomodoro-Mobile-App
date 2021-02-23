import 'package:flutter/material.dart';
import 'package:pomodoro_app/screens/Timer/timer.dart';
import '../register/signup.dart';
import '../register/forget.dart';

class Signin extends StatefulWidget {
  static const routeName = '/login';

  @override
  _State createState() => _State();
}

class _State extends State<Signin> {
  var _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

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
                          'Welcome Back',
                          style: TextStyle(
                              color: Colors.green[300],
                              fontWeight: FontWeight.w500,
                              fontSize: 30),
                        )),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: TextFormField(
                        autofocus: true,
                        controller: nameController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'User Name',
                        ),
                        validator: (String value) {
                          return value.isEmpty ? "The Username is Empty" : null;
                        },
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                      child: TextFormField(
                        obscureText: true,
                        controller: passwordController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Password',
                        ),
                        validator: (String value) {
                          return value.isEmpty ? "The Password is Empty" : null;
                        },
                      ),
                    ),
                    FlatButton(
                      textColor: Colors.green[200],
                      child: Text('Forgot Password',
                          style: TextStyle(fontSize: 50)),

                      onPressed: () {
                        //signup screen
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ForgetPassword()));
                      },
                      //fo
                    ),
                    Container(
                        height: 50,
                        width: 250.00,
                        child: RaisedButton(
                            onPressed: () {
                              print(nameController.text);
                              print(passwordController.text);
                              setState(() {
                                if (_formKey.currentState.validate()) {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => TimerScreen()));
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
                    ))
                  ],
                ))));
  }
}
