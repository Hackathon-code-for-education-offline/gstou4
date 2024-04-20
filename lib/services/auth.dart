import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';

import 'package:gstou4/models/user_model.dart';

class AuthService {

  final FirebaseAuth _auth  = FirebaseAuth.instance;

  UserModel? _userFromFirebaseUser(User? user) {
    return user != null ? UserModel(user.uid) : null;
  }

  Stream<UserModel?> get user {
    return _auth.authStateChanges().map(_userFromFirebaseUser);
  }

  // sign in anon
  Future signInAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User user = result.user!;
      return _userFromFirebaseUser(user);
    }
    catch(error) {
      //TODO: disable on release
      print(error.toString());
      return null;
    }
  }

  // sign in with email and password

  // sign up with email and password
  Future signUp(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User? user = result.user;
      return _userFromFirebaseUser(user);
    }
    catch(error) {
      //TODO: disable on release
      print(error.toString());
      return null;
    }
  }

  // sing out
  Future signOut() async {
    try {
      return await _auth.signOut();
    }
    catch(error) {
      //TODO: disable on release
      print(error.toString());
      return null;
    }
  }

}
