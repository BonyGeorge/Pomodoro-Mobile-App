import 'package:flutter/material.dart';
import 'package:pomodoro_app/screens/Profile/profile.dart';
import 'package:pomodoro_app/ui/drawer.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';

class Editprofile extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<Editprofile> {
  //var _formKey = GlobalKey<FormState>();
  TextEditingController fnameController = TextEditingController();
  TextEditingController aboutController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController numController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: GradientAppBar(
        title: Text('Edit Profile'),
        backgroundColorStart: Colors.cyan,
        backgroundColorEnd: Colors.green,
      ),
      body: Column(
        children: <Widget>[
          Container(
              child: Container(
            width: double.infinity,
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 6.0,
                  )
                ],
              ),
            ),
          )),
          Container(
            padding:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
            child: TextFormField(
              autofocus: true,
              maxLength: 25,
              controller: fnameController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Full Name',
              ),
              onSaved: (value) {
                print("Saved form $value");
              },
            ),
          ),
          Container(
            padding:
                const EdgeInsets.symmetric(vertical: 0.0, horizontal: 16.0),
            child: TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'E-mail',
              ),
            ),
          ),
          Container(
            padding:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
            child: TextFormField(
                maxLength: 11,
                controller: numController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Mobile Number',
                ),
                validator: (value) {
                  return value.isEmpty ? "This Entity is Empty" : null;
                }),
          ),
          Container(
            padding:
                const EdgeInsets.symmetric(vertical: 0.0, horizontal: 16.0),
            child: TextFormField(
              controller: aboutController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'About me',
              ),
            ),
          ),
          SizedBox(
            height: 30.0,
          ),
          Container(
            width: 160.00,
            child: RaisedButton(
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => ProfileApp()));
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(60.0)),
                elevation: 0.0,
                padding: EdgeInsets.all(0.0),
                child: Ink(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.centerRight,
                        end: Alignment.centerLeft,
                        colors: [Colors.green, Colors.green]),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Container(
                    constraints:
                        BoxConstraints(maxWidth: 200.0, minHeight: 50.0),
                    alignment: Alignment.center,
                    child: Text(
                      "Done",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25.0,
                          fontWeight: FontWeight.w300),
                    ),
                  ),
                )),
          ),
        ],
      ),
    );
  }
}
