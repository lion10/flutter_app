import 'package:cloud_firestore/cloud_firestore.dart';


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

  // use this data in home screen
  Stream<QuerySnapshot> get brews {
    return brewCollection.snapshots();
  }



}