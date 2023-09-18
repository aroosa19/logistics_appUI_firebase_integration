import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_integration/UI/posts/post_screen.dart';
import 'package:firebase_integration/Utils/Utils.dart';
import 'package:flutter/material.dart';
import '../reuseable_widgets/round_button.dart';

class VerifyCode extends StatefulWidget {
  final String verificationId;
  const VerifyCode({super.key, required this.verificationId});

  @override
  State<VerifyCode> createState() => _VerifyCodeState();
}

class _VerifyCodeState extends State<VerifyCode> {
  bool loading = false;
  final verifyCodeController = TextEditingController();
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Verification'),
        backgroundColor: const Color(0xff001B43),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            TextFormField(
              controller: verifyCodeController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(hintText: '6 digit code'),
            ),
            const SizedBox(
              height: 80,
            ),
            RoundButton(
                title: 'Verify',
                loading: loading,
                onTap: () async {
                  setState(() {
                    loading = true;
                  });
                  final credentials = PhoneAuthProvider.credential(
                      verificationId: widget.verificationId,
                      smsCode: verifyCodeController.text.toString());
                  // using ty catch for exception handling
                  try {
                    await auth.signInWithCredential(credentials);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const PostScreen()));
                  } catch (e) {
                    setState(() {
                      loading = false;
                    });
                    Utils().toastMessage(e.toString());
                  }
                })
          ],
        ),
      ),
    );
  }
}
