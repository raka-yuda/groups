import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';

enum authProblems { UserNotFound, PasswordNotValid, NetworkError }

class AuthenticationService {
  final FirebaseAuth _auth;

  AuthenticationService(this._auth);

  Stream<User> get authStateChange => _auth.authStateChanges();

  Future<String> signIn(String email, String password) async {
    try {
      User user = (await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      ))
          .user;
      return 'success';
    } on FirebaseAuthException catch (e) {
      authProblems errorType;
      switch (e.message) {
        case 'There is no user record corresponding to this identifier. The user may have been deleted.':
          errorType = authProblems.UserNotFound;
          return errorType.toString();
          break;
        case 'The password is invalid or the user does not have a password.':
          errorType = authProblems.PasswordNotValid;
          return errorType.toString();
          break;
        case 'A network error (such as timeout, interrupted connection or unreachable host) has occurred.':
          errorType = authProblems.NetworkError;
          return errorType.toString();
          break;
        default:
          print('Case ${e.message} is not yet implemented');
          return e.code.toString();
      }

      // if (e.code == 'user-not-found') {
      //   print('No user found for that email.');
      // } else if (e.code == 'wrong-password') {
      //   print('Wrong password provided for that user.');
      // }
      // return e.code;
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }

  Future<String> getCurrentUser() async {
    return _auth.currentUser.email;
  }

  Future<String> createUser(String email, String password) async {
    try {
      User user = (await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      ))
          .user;
      return 'success';
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }
}
