import 'package:flutter/material.dart';
import 'package:flutter_app_firebase/screens/authenticate/authenticate.dart';
import 'home/home.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    // return either home or authenticate widget
    return  Authenticate();
  }
}
