import 'package:firebase_integration/UI/GuestUser/guestuserhome.dart';
import 'package:firebase_integration/auth/signup_screen.dart';
import 'package:firebase_integration/reuseable_widgets/cardboxwidget.dart';
import 'package:firebase_integration/reuseable_widgets/round_button.dart';
import 'package:flutter/material.dart';

class Register extends StatelessWidget {
  const Register(
      {Key? key}); // Use 'Key?' instead of 'super.key' to fix the issue

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 40.0),
            const Text(
              'LOGO',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 80.0),
            const Text(
              'Welcome to Logistics',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16.0),
            const Text(
              '(Choose Tagline/Slogan for the service)',
              style: TextStyle(fontSize: 16.0),
            ),
            const SizedBox(
              height: 80.0,
            ),
            const Text(
              'Choose how you want to use the app!',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: CardBox(
                    imageUrl: 'images/customer.png',
                    text1: 'As a Customer',
                    text2:
                        'Hire a rider to deliver items according to your desired weight, budget and location.',
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignupScreen()));
                    },
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignupScreen()));
                    },
                    child: CardBox(
                      imageUrl: 'images/serviceprovider.png',
                      text1: 'As a Service Provider',
                      text2:
                          'Register your delivery services & get connected to clients.',
                      onTap: () {},
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 40.0),
            RoundButton(
              title: 'Continue as Guest',
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const GuestUserHomeScreen()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
