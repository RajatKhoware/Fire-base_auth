// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_firebase_auth/utils/showOTP_dialog.dart';
import 'package:flutter_firebase_auth/utils/showSnakeBar.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthMethods {
  final FirebaseAuth _auth;
  FirebaseAuthMethods(this._auth);

  User get user => _auth.currentUser!;

  //STATE PRESISTENCE
  Stream<User?> get authState => FirebaseAuth.instance.authStateChanges();
  //FirebaseAuth.instance.userChanges();
  //FirebaseAuth.instance.idTokenhanges();

  // Email Sign Up
  Future<void> signUpWithEmail({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      // ignore: use_build_context_synchronously
      await sendEmailVerification(context);
    } on FirebaseAuthException catch (e) {
      showSnakeBar(context, e.message!);
    }
  }

  // Login
  Future<void> loginWithEmail({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (!_auth.currentUser!.emailVerified) {
        //if it was not verified we have to send email.
        // ignore: use_build_context_synchronously
        await sendEmailVerification(context);
      }
    } on FirebaseAuthException catch (e) {
      showSnakeBar(context, e.message!);
    }
  }

  // Email Verification
  Future<void> sendEmailVerification(BuildContext context) async {
    try {
      _auth.currentUser!.sendEmailVerification();
      showSnakeBar(context, 'Email verification sent!');
    } on FirebaseAuthException catch (e) {
      showSnakeBar(context, e.message!);
    }
  }

  // Phone sign In
  Future<void> phoneSignIn(
    BuildContext context,
    String phoneNumber,
  ) async {
    final TextEditingController codeController = TextEditingController();
    // If on web this code works.
    if (kIsWeb) {
      ConfirmationResult result =
          await _auth.signInWithPhoneNumber(phoneNumber);

      // Display Dialog Box to accept OTP
      showOTPDialog(
        context: context,
        codeController: codeController,
        onPressed: () async {
          PhoneAuthCredential credential = PhoneAuthProvider.credential(
            verificationId: result.verificationId,
            smsCode: codeController.text.trim(),
          );
          await _auth.signInWithCredential(credential);
          // ignore: use_build_context_synchronously
          Navigator.of(context).pop();
        },
      );
    }
    // If on android or ios this code works.
    else {
      await _auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (PhoneAuthCredential credential) async {
          await _auth.signInWithCredential(credential);
        },
        verificationFailed: (e) {
          showSnakeBar(context, e.message!);
        },
        codeSent: ((String verficationId, int? resendToken) async {
          // Display Dialog Box to accept OTP
          showOTPDialog(
            context: context,
            codeController: codeController,
            onPressed: () async {
              PhoneAuthCredential credential = PhoneAuthProvider.credential(
                verificationId: verficationId,
                smsCode: codeController.text.trim(),
              );
              await _auth.signInWithCredential(credential);
              // ignore: use_build_context_synchronously
              Navigator.of(context).pop();
            },
          );
        }),
        codeAutoRetrievalTimeout: (String verifcationId) {},
      );
    }
  }

  // Google Sign In
  Future<void> signInWithGoogle(BuildContext context) async {
    try {
      if (kIsWeb) {
        GoogleAuthProvider googleProvider = GoogleAuthProvider();

        googleProvider
            .addScope('https://www.googleapis.com/auth/contacts.readonly');

        await _auth.signInWithPopup(googleProvider);
      } else {
        final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

        //saving the variable by getting it from googleUser.
        final GoogleSignInAuthentication? googleAuth =
            await googleUser?.authentication;

        if (googleAuth?.accessToken != null && googleAuth?.idToken != null) {
          //Create a new credential
          final credential = GoogleAuthProvider.credential(
            accessToken: googleAuth?.accessToken,
            idToken: googleAuth?.idToken,
          );

          //with this credential we can get userid and pass if we wamt.
          UserCredential userCredential =
              await _auth.signInWithCredential(credential);

          // if you want to do specific task like storing information in firestore
          // only for new users using google sign in (since there are no two options
          // for google sign in and google sign up, only one as of now),
          // do the following:

          // if (userCredential.user != null) {
          //   if (userCredential.additionalUserInfo!.isNewUser) {}
          // }

        }
      }
      //sigin in the user with google.
    } on FirebaseAuthException catch (e) {
      showSnakeBar(context, e.message!);
    }
  }

  //FACEBOOK SIGIN
  Future<void> signInWithFacebook(BuildContext context) async {
    try {
      final LoginResult loginResult = await FacebookAuth.instance.login();

      final OAuthCredential facebookAuthCredential =
          FacebookAuthProvider.credential(loginResult.accessToken!.token);

      await _auth.signInWithCredential(facebookAuthCredential);
    } on FirebaseException catch (e) {
      showSnakeBar(context, e.message!);
    }
  }

  //ANONYMOUS SIGIN
  Future<void> signInAnonymously(BuildContext context) async {
    try {
      await _auth.signInAnonymously();
    } on FirebaseException catch (e) {
      showSnakeBar(context, e.message!);
    }
  }

  // SIGN OUT
  Future<void> signOut(BuildContext context) async {
    try {
      await _auth.signOut();
    } on FirebaseAuthException catch (e) {
       showSnakeBar(context, e.message!); // Displaying the error message
    }
  }

  // DELETE ACCOUNT
  Future<void> deleteAccount(BuildContext context) async {
    try {
      await _auth.currentUser!.delete();
    } on FirebaseAuthException catch (e) {
      showSnakeBar(context, e.message!); // Displaying the error message
      // if an error of requires-recent-login is thrown, make sure to log
      // in user again and then delete account.
    }
  }
}
