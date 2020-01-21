import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_app_firebase/models/brew.dart';


class DatabaseServices{

  final String uid ;
  DatabaseServices({this.uid});


  //collection reference
  final CollectionReference brewCollection = Firestore.instance.collection('brews');

  Future updateUserData(String sugars , String name , int strength) async{
    return await brewCollection.document(uid).setData({
        'sugars': sugars ,
        'name':name,
        'strength': strength,
    });
  }



  // brew list from snapshot
  List<Brew> _brewListFromSnapshot(QuerySnapshot snapshot){
    return snapshot.documents.map((doc){
      return Brew(
        sugars: doc.data['sugars'] ?? '0',
        name: doc.data['name'] ?? '',
        strength: doc.data['strength'] ?? 0,
      );
    }).toList();
  }


  // use this data in home screen
  Stream<List<Brew>> get brews {
    return brewCollection.snapshots().map(_brewListFromSnapshot);
  }



}