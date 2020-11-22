import 'package:flutter/material.dart';
import 'package:pomodoro_app/screens/profile.dart';

class ForgetPassword extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<ForgetPassword> {
  var _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController confirmEmail = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Form(
            key: _formKey,
            child: Padding(
                padding: EdgeInsets.all(10),
                child: ListView(
                  children: <Widget>[
                    SizedBox(
                      height: 40.0,
                    ),
                    Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.all(10),
                        child: Text(
                          'Reset Password',
                          style: TextStyle(
                              color: Colors.green[300],
                              fontWeight: FontWeight.w500,
                              fontSize: 30),
                        )),
                    SizedBox(
                      height: 30.0,
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: TextFormField(
                        autofocus: true,
                        controller: emailController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Email',
                        ),
                        validator: (String value) {
                          if (value.isEmpty) return "This Entity is Empty";
                        },
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                      child: TextFormField(
                        obscureText: true,
                        controller: confirmEmail,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Confirm Email',
                        ),
                        validator: (String value) {
                          if (value.isEmpty) return "This Entity is Empty";
                        },
                      ),
                    ),
                    SizedBox(
                      height: 40.0,
                    ),
                    Container(
                        height: 50,
                        width: 250.00,
                        child: RaisedButton(
                            onPressed: () {
                              print(emailController.text);
                              print(confirmEmail.text);

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
                                    " Reset ",
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
