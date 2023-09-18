import 'dart:async';
import 'package:firebase_integration/UI/UserPermissions/terms&services.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 5), () {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const TermsAndServices()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Added Background image with gradient
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  'https://images.pexels.com/photos/6169191/pexels-photo-6169191.jpeg?auto=compress&cs=tinysrgb&w=600',
                ),
                fit: BoxFit.cover,
              ),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFF444444), // Hex: #444444 as given in figma file
                  Color(0xFF000000), // Hex: #000000
                ],
              ),
            ),
          ),
          const Positioned(
            top: 30,
            left: 0,
            right: 0,
            child: Center(
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  'Logistics',
                  style: TextStyle(
                    fontSize: 42,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
