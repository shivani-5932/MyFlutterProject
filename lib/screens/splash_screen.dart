import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, '/onboarding');
    });
    return Scaffold(
      backgroundColor: Colors.white,   //
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              'assets/images/home_image.png',
              width: 220,
            ),
            const SizedBox(height: 24),
            const Text(
              'One Roof',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w600,
                color: Color(0xFFFF9C8B),
                letterSpacing: 1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
