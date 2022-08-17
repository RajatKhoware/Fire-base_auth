import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_auth/services/firebase_auth_method.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_textfield.dart';

class PhoneScreen extends StatefulWidget {
  static String routeName = '/login-phone-number';
  const PhoneScreen({Key? key}) : super(key: key);

  @override
  State<PhoneScreen> createState() => _PhoneScreenState();
}

class _PhoneScreenState extends State<PhoneScreen> {
  final phoneNumnerController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    phoneNumnerController.dispose();
  }

  void phoneSignIn() {
    FirebaseAuthMethods(FirebaseAuth.instance)
        .phoneSignIn(context, phoneNumnerController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Login with Phone-Number",
              style: TextStyle(fontSize: 30),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.08,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: CustomTextField(
                  controller: phoneNumnerController,
                  hintText: 'Enter your phone number'),
            ),
            const SizedBox(height: 40),
            CustomButton(onTap: phoneSignIn, text: "Get OTP")
          ],
        ),
      ),
    );
  }
}
