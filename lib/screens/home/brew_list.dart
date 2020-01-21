import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_firebase/models/brew.dart';
import 'package:provider/provider.dart';


class BrewList extends StatefulWidget {
  @override
  _BrewListState createState() => _BrewListState();
}

class _BrewListState extends State<BrewList> {
  @override
  Widget build(BuildContext context) {
    final brews = Provider.of<List<Brew>>(context);

    if (brews != null){
      brews.forEach((brew){
        print(brew.name);
        print(brew.strength);
        print(brew.sugars);
      });
    }
    return Container(
      child: Text('brew list yea '),
    );
  }
}
