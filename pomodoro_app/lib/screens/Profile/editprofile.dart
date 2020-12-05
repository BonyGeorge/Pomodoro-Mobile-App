import 'package:flutter/material.dart';
import 'package:pomodoro_app/screens/Profile/profile.dart';
import 'package:pomodoro_app/ui/drawer.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';

class Editprofile extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<Editprofile> {
  var _formKey = GlobalKey<FormState>();
  TextEditingController fnameController = TextEditingController();
  TextEditingController aboutController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController numController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       drawer: MyDrawer(),
      appBar: GradientAppBar(

        backgroundColorStart: Colors.cyan,
        backgroundColorEnd: Colors.green,
      ),
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
                          'Edit your profile!',
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
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: TextFormField(
                        maxLength: 100,
                        controller: aboutController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'About',
                        ),
                      ),
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
                          if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                              .hasMatch(value)) {
                            return 'Please enter a valid Email';
                          }
                          return null;
                        },
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: TextFormField(
                        maxLength: 11,
                        keyboardType: TextInputType.number,
                        controller: numController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Mobile Number',
                        ),
                        validator: (value) {
                          if (!RegExp(r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$')
                                  .hasMatch(value) &&
                              // ignore: unrelated_type_equality_checks
                              value.length != 11) {
                            return 'Enter 11 No. only without letters';
                          }
                          return null;
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
                            print(aboutController.text);
                            print(emailController.text);
                            print(numController.text);

                            setState(() {
                              if (_formKey.currentState.validate()) {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ProfileApp()));
                                if (_formKey.currentState.validate()) {
                                  Scaffold.of(context).showSnackBar(SnackBar(
                                      content: Text("Processing Data")));
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
                                " Done",
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
