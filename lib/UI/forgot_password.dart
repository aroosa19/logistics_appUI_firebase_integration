import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_integration/Utils/Utils.dart';
import 'package:firebase_integration/reuseable_widgets/round_button.dart';
import 'package:flutter/material.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final emailController = TextEditingController();
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Forgot Password'),
        backgroundColor: const Color(0xff001B43),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Not to worry! We will help you recover your account in a few simple steps.',
              style: TextStyle(
                fontSize: 16,
                fontStyle: FontStyle.italic,
              ),
            ),
            const SizedBox(
              height:
                  20, // Added spacing between the static text and TextFormField
            ),
            TextFormField(
              controller: emailController,
              decoration: const InputDecoration(
                  hintText: 'Enter your account email ID'),
            ),
            const SizedBox(
              height: 200, // Added spacing between the text fields
            ),
            RoundButton(
                title: 'Get Code',
                onTap: () {
                  auth
                      .sendPasswordResetEmail(
                          email: emailController.text.toString())
                      .then((value) {
                    Utils().toastMessage(
                        'We have sent you the verification email. Please check your email.');
                  }).onError((error, stackTrace) {
                    Utils().toastMessage(error.toString());
                  });
                })
          ],
        ),
      ),
    );
  }
}
