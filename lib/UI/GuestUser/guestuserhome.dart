import 'package:firebase_integration/UI/GuestUser/order.dart';
import 'package:firebase_integration/auth/login_screen.dart';
import 'package:firebase_integration/reuseable_widgets/round_button.dart';
import 'package:flutter/material.dart';

class GuestUserHomeScreen extends StatelessWidget {
  const GuestUserHomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 40.0),
              Row(
                children: [
                  const Expanded(
                    child: Center(
                      child: Text(
                        'LOGO',
                        style: TextStyle(
                            fontSize: 24.0, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginScreen()));
                    },
                    child: const Align(
                      alignment: Alignment.topRight,
                      child: Text(
                        'Login',
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 80.0),
              const Text(
                'Got a parcel to deliver',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 30.0),
              const Text(
                'Place an order now and avail the services of our door-to-door riders, from the comfort of your home!',
                style: TextStyle(fontSize: 16.0),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 50.0,
              ),
              SizedBox(
                  height: 300,
                  child:
                      Image.asset('images/guestuser.png', fit: BoxFit.cover)),
              const SizedBox(
                height: 20.0,
              ),
              const SizedBox(height: 40.0),
              RoundButton(
                title: 'Book a Service',
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const GuestOrder()));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
