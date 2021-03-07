import 'package:flutter/material.dart';
import 'package:pomodoro_app/screens/register/login.dart';
import 'package:flutter/services.dart';

class Signup extends StatefulWidget {
  static const routeName = '/signup';

  @override
  _State createState() => _State();
}

class _State extends State<Signup> {
  var _formKey = GlobalKey<FormState>();
  var newpass;
  TextEditingController fnameController = TextEditingController();
  TextEditingController lnameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController conController = TextEditingController();
  TextEditingController numController = TextEditingController();

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
                        margin: EdgeInsets.all(30),
                        child: Text(
                          'Join Us!',
                          style: TextStyle(
                              color: Colors.green[300],
                              fontWeight: FontWeight.w500,
                              fontSize: 30),
                        )),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: TextFormField(
                        autofocus: true,
                        maxLength: 25,
                        controller: fnameController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Full Name',
                        ),
                        validator: (value) {
                          return value.isEmpty
                              ? "The name field is Empty"
                              : null;
                        },
                        onSaved: (value) {
                          print("Saved form $value");
                        },
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: TextFormField(
                        maxLength: 15,
                        controller: lnameController,
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
                      padding: EdgeInsets.all(10),
                      child: TextFormField(
                          keyboardType: TextInputType.number,
                          maxLength: 11,
                          controller: numController,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                          ],
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Mobile Number',
                              hintText: "01*********"),
                          validator: (value) {
                            if (value.isEmpty) {
                              return value.isEmpty
                                  ? "The Mobile field is Empty"
                                  : null;
                            } else if (value.length < 11) {
                              return 'Enter sum of 11 Numbers';
                            }
                            return null;
                          }),
                    ),
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
                          validator: (value) {
                            newpass = value;
                            if (value.length < 8) {
                              return "Password must be longer than 8 characters";
                            } else if (value.isEmpty) {
                              return "The Password field is Empty";
                            } else {
                              return null;
                            }
                          }),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                      child: TextFormField(
                        obscureText: true,
                        controller: conController,
                        maxLength: 37,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Confirm Password',
                            hintText: "**********"),
                        validator: (String value) {
                          if (value.isEmpty) {
                            return "Please Re-Enter the Password";
                          } else if (value != newpass) {
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
                            print(fnameController.text);
                            print(lnameController.text);
                            print(emailController.text);
                            print(numController.text);
                            print(passwordController.text);
                            print(conController);

                            setState(() {
                              if (_formKey.currentState.validate()) {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Signin()));
                                if (_formKey.currentState.validate()) {
                                  print("Processing Data...");
                                }
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
                                " Signup",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 25.0,
                                    fontWeight: FontWeight.w300),
                              ),
                            ),
                          )),
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    Container(
                      height: 50,
                      width: 250.00,
                      child: RaisedButton(
                          onPressed: () {
                            //signup screen
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Signin()));
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
                                " Sign In ",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 25.0,
                                    fontWeight: FontWeight.w300),
                              ),
                            ),
                          )),
                    ),
                  ],
                ))));
  }
}
