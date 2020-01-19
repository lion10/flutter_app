import 'package:flutter/material.dart';
import 'package:flutter_app_firebase/screens/authenticate/sign_in.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => new _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  @override
  Widget build(BuildContext context) {
    return new Container(
      child: SignIn(),
    );
  }
}
