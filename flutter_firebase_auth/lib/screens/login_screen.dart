import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_auth/screens/login_email_password_screen.dart';
import 'package:flutter_firebase_auth/screens/phone_screen.dart';
import 'package:flutter_firebase_auth/screens/sign_up_email_pass.dart';
import 'package:flutter_firebase_auth/services/firebase_auth_method.dart';
import 'package:flutter_firebase_auth/widgets/custom_button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            CustomButton(
                onTap: () {
                  Navigator.pushNamed(context, EmailPasswordSignUp.routeName);
                },
                text: "Email/Password Sign Up"),
            CustomButton(
                onTap: () {
                  Navigator.pushNamed(context, EmailPasswordLogin.routeName);
                },
                text: "Email/Password Login"),
            CustomButton(
                onTap: () {
                  Navigator.pushNamed(context, PhoneScreen.routeName);
                },
                text: "Phone Sign In"),
            CustomButton(
                onTap: () {
                  FirebaseAuthMethods(FirebaseAuth.instance)
                      .signInWithGoogle(context);
                },
                text: "Google Sign In"),
            CustomButton(onTap: () {
              FirebaseAuthMethods(FirebaseAuth.instance)
                      .signInWithFacebook(context);
            }, text: "Facebook Sign In"),
            CustomButton(onTap: () {
              FirebaseAuthMethods(FirebaseAuth.instance)
                      .signInAnonymously(context);
            }, text: "Anonymous Sign In"),
          ],
        ),
      ),
    );
  }
}
