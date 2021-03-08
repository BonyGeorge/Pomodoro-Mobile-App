import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:pomodoro_app/screens/Profile/profile.dart';
import 'package:pomodoro_app/widgets/drawer.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:pomodoro_app/providers/auth.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';



class Editprofile extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<Editprofile> {

 File avatarImageFile, backgroundImageFile;
  
  var _formKey = GlobalKey<FormState>();
  TextEditingController fnameController = TextEditingController();
  TextEditingController numController = TextEditingController();

 
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<Auth>(context);
    return Scaffold(
        drawer: MyDrawer(),
        appBar: GradientAppBar(
          title: Text('Edit your Profile'),
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
                    SizedBox(
                      height: 30.0,
                    ),
                    Container(
                      height: 50,
                      width: 250.00,
                      child: RaisedButton(
                          onPressed: () async{
                            print(fnameController.text);
                            print(numController.text);

                            
                              if (_formKey.currentState.validate()) {
                                try{
                                //await Provider.of<Auth>(context,listen: false).update("fullname", "phone")

                               user.update(fnameController.text,numController.text);
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ProfileApp()));                       
                              }
                              catch(error){
                                print(error);
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
