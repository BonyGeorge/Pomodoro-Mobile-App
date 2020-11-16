import 'package:flutter/material.dart';
import 'package:pomodoro_app/screens/profile.dart';
import '../register/signup.dart';
import '../register/forget.dart';

class Signin extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<Signin> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
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
                  child: TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'User Name',
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextField(
                    obscureText: true,
                    controller: passwordController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                    ),
                  ),
                ),
                FlatButton(
                  onPressed: () {
                    //signup screen
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ForgetPassword()));
                  },
                  //forgot password screen

                  textColor: Colors.green[300],
                  child: Text('Forgot Password'),
                ),
                Container(
                    height: 50,
                    width: 250.00,
                    child: RaisedButton(
                        onPressed: () {
                          print(nameController.text);
                          print(passwordController.text);
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ProfileApp()));
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
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) => Signup()));
                      },
                    )
                  ],
                  mainAxisAlignment: MainAxisAlignment.center,
                ))
              ],
            )));
  }
}
