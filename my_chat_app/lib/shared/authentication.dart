import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:my_chat_app/shared/database_helper.dart';

class Authentication {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final DatabaseHelper db = DatabaseHelper();

  Future<String?> login(String email, String password) async {
    UserCredential authResult = await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);

    User? user = authResult.user;
    return user?.uid;
  }

  Future<String?> signUp(String email, String password, String name) async {
    UserCredential authResult = await _firebaseAuth
        .createUserWithEmailAndPassword(email: email, password: password);

    Map<String, String> userMap = {
      "name": name,
      "email": email,
    };

    db.uploadUser(userMap);

    User? user = authResult.user;
    return user?.uid;
  }

  Future signOut() async {
    return _firebaseAuth.signOut();
  }

  Future getUser() async {
    User? user = await _firebaseAuth.currentUser;

    return user;
  }
}
