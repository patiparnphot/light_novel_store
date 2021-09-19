import 'package:firebase_auth/firebase_auth.dart';

class Auth {
  final FirebaseAuth auth;

  Auth({required this.auth});

  Stream<User?> get user => auth.authStateChanges().map(_userFromFirebase);

  User? _userFromFirebase(User? user) {
    if (user == null) {
      return null;
    }
    return user;
  }

  Future<String> signIn({required String email, password}) async {
    try {
      await auth.signInWithEmailAndPassword(email: email.trim(), password: password.trim());
      return "Success";
    } on FirebaseAuthException catch (e) {
      if (e.message == null) {
        return "Fail";
      }
      return e.message.toString();
    }
  }

  Future<String> createAccount({required String email, password}) async {
    try {
      await auth.createUserWithEmailAndPassword(email: email.trim(), password: password.trim());
      return "Success";
    } on FirebaseAuthException catch (e) {
      if (e.message == null) {
        return "Fail";
      }
      return e.message.toString();
    }
  }

  Future<String> signOut() async {
    try {
      await auth.signOut();
      return "Success";
    } on FirebaseAuthException catch (e) {
      if (e.message == null) {
        return "Fail";
      }
      return e.message.toString();
    }
  }
}