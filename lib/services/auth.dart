import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_app_firebase/models/user.dart';


class AuthService {

  // _ that mean just as private yea we can use it just in this file
  final FirebaseAuth _auth = FirebaseAuth.instance;

  User _userFromFirebase(FirebaseUser user){
    return user.uid != null ? User(uid: user.uid) : null ;
  }

  // listen for authentication change so wrapper class will depend on it to make sure just
  // authentication class are allowed to enter home page

  Stream<User> get user{  // get : to get keyword
    return _auth.onAuthStateChanged
  //      .map((FirebaseUser user)=> _userFromFirebase(user));  // this the same as bottom line but this is as implied
          .map(_userFromFirebase);
  }

  // sign in anon
  Future signInAnon() async{
    try{
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      return _userFromFirebase(user) ;
    }catch(e){
      print(e.toString());
      return null ;
    }
  }



  // sign in with email and pass
  // register with email and pass


  //sign out
  Future signOut() async{
    try{
      return await _auth.signOut();
    }catch(e){
      print(e.toString());
      return null ;
    }
  }




}