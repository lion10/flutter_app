import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_app_firebase/models/user.dart';
import 'package:flutter_app_firebase/services/auth.dart';

class SignIn extends StatefulWidget {

  final Function toggleView ; // cuz we need to pass func by contructor
  SignIn({this.toggleView});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final AuthService _auth = AuthService();
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        title: Text('Sign in to Brew Crew'),
        actions: <Widget>[
          FlatButton.icon(
              icon: Icon(Icons.person),
              label: Text('Rigester'),
               onPressed: (){
                widget.toggleView(); // i didn't use this.toggleView cuz this for state
                                    // object so i used widget.toggleView() refers to widget itself
               },
          )
        ],

      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Form(
          child:Column(
            children: <Widget>[
              SizedBox(height: 20.0,),
              TextFormField(
                onChanged: (val){
                  setState(() => email =val );
                },
              ),
              SizedBox(height: 20.0,),
              TextFormField(
                obscureText: true,
                onChanged: (val){
                  setState(() => password =val );
                },
              ),
              RaisedButton(
                color: Colors.pink[400],
                child: Text('Sign in',style: TextStyle(color: Colors.white),),
                onPressed: () async{
                  print(email);
                  print(password);
                },
              )
            ],
          ),


        ),
      ),
    );
  }
}