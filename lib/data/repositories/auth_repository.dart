import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';

class AuthRepository {
  final firebaseAuth = FirebaseAuth.instance;

  Future<void> signUp({required String email, required String password}) async {
    try {
      FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseException catch (e) {
      if (e.code == "weak-password") {
        throw Exception("This password is weak");
      } else if (e.code == "email-already-in-use") {
        throw Exception("An account already exists for this email");
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<String?> login(
      {required String email, required String password}) async {
    try {
      print(email);
      print(password);

      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'network-request-failed') {
        return 'Check your internet and try again';
      }
      return e.message ?? 'An error occured';
    } on Exception catch (e) {
      return e.toString();
    }
    return null;
  }
}
