import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:grad_project/core/utils/helpers.dart';

import '../models/process_response.dart';

class FbAuthController with Helpers {
  FbAuthController._();

  static FbAuthController? _instance;

  factory FbAuthController() {
    return _instance ??= FbAuthController._();
  }

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<bool> signIn({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (userCredential.user != null) {
        if (userCredential.user!.emailVerified) {
          return true;
        } else {
          await _auth.signOut();
          showSnackBar(
            context: context,
            message: 'Please verify your email!',
            error: true,
          );
          return false;
        }
      }
      return false;
    } on FirebaseAuthException catch (exception) {
      _controlException(context, exception);
    } catch (exception) {
      //
    }

    return false;
  }

  Future<bool> register({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (!userCredential.user!.emailVerified) {
        await userCredential.user!.sendEmailVerification();
      }

      await _auth.signOut();
      return true;
    } on FirebaseAuthException catch (exception) {
      print(exception.code);
      if (exception.code == 'email-already-in-use') {
        // Email is already registered
        UserCredential signInCredential =
            await _auth.signInWithEmailAndPassword(
          email: email,
          password: password,
        );

        if (!signInCredential.user!.emailVerified) {
          await signInCredential.user!.sendEmailVerification();
        }
        await _auth.signOut();

        _controlException(context, exception);
        return false;
      } else {
        _controlException(context, exception);
        return false;
      }
    }
  }

  Future<ProcessResponse> sendPasswordResetEmail(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
      return ProcessResponse("Reset email sent successfully");
    } on FirebaseAuthException catch (e) {
      return ProcessResponse(e.message ?? '', false);
    }
  }

  bool get isLoggedIn => _auth.currentUser != null;

  User get user => _auth.currentUser!;

  Future<void> signOut() => _auth.signOut();

  void _controlException(
    BuildContext context,
    FirebaseAuthException exception,
  ) {
    String error = '';
    switch (exception.code) {
      case 'wrong-password':
        error = 'wrong password';
        break;
      case 'user-not-found':
        error = 'user not found';
        break;
      case 'network-request-failed':
        error = 'network request failed';
        break;
      case 'user-disabled':
        error = 'user disabled';
        break;
      case 'invalid-email':
        error = 'invalid email';
        break;
      case 'email-already-in-use':
        error = 'email already in use';
        break;
      default:
        error = 'unknown error';
        break;
    }
    showError(context: context, error: error);
  }

  showError({required BuildContext context, required String error}) {
    showSnackBar(context: context, message: error, error: true);
  }
}
