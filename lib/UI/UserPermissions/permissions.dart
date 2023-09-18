import 'package:firebase_integration/UI/splash_screen.dart';
import 'package:firebase_integration/UI/UserPermissions/location_permission.dart';
import 'package:firebase_integration/reuseable_widgets/round_button.dart';
import 'package:flutter/material.dart';

class Permission extends StatelessWidget {
  const Permission({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 330,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(2),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 6,
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 80,
                  ),
                  Expanded(
                    child: Text(
                      "Allow logistics to make and \nmanage phone calls?",
                      style: TextStyle(color: Colors.black, fontSize: 20),
                      textAlign: TextAlign.center,
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 100,
              ),
              RoundButton(
                title: 'Allow',
                onTap: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                        builder: (context) => const LocationPermission()),
                  );
                },
              ),
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                width: 300,
                height: 50,
                child: OutlinedButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                            builder: (context) => const SplashScreen()),
                      );
                    },
                    child: const Text('Deny')),
              ),
              const SizedBox(
                height: 15,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
