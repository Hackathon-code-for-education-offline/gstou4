import 'package:firebase_auth/firebase_auth.dart';


class AuthService {

  final FirebaseAuth _auth  = FirebaseAuth.instance;

  // sign in anon
  Future signInAnon() async {
    try {

      UserCredential result = await _auth.signInAnonymously();
      User user = result.user!;
      return user;
    }
    catch(error) {
      //TODO: disable on release
      return null;
    }
  }

  // sign in with email and password

  // sign up with email and password

}
