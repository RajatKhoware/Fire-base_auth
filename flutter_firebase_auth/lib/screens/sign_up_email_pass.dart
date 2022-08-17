import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_auth/services/firebase_auth_method.dart';
import 'package:flutter_firebase_auth/widgets/custom_button.dart';
import 'package:flutter_firebase_auth/widgets/custom_textfield.dart';

class EmailPasswordSignUp extends StatefulWidget {
  static String routeName = '/signup-email-password';
  const EmailPasswordSignUp({Key? key}) : super(key: key);

  @override
  State<EmailPasswordSignUp> createState() => _EmailPasswordLoginState();
}

class _EmailPasswordLoginState extends State<EmailPasswordSignUp> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  void signUpUser() async{
    FirebaseAuthMethods(FirebaseAuth.instance).signUpWithEmail(
      email: emailController.text,
      password: passwordController.text,
      context: context,
      ); 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Sign Up",
            style: TextStyle(fontSize: 30),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.08,
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: CustomTextField(
                controller: emailController, hintText: 'Enter your email'),
          ),
          const SizedBox(height: 20),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: CustomTextField(
                controller: passwordController,
                hintText: 'Enter your password'),
          ),
          const SizedBox(height: 40),
          CustomButton(onTap: signUpUser, text: "Sign Up")
        ],
      ),
    );
  }
}
