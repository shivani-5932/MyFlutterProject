import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16), // ✅ global padding
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              /// LOGO
              Image.asset(
                'assets/images/one_roof_logo.png',
                height: 50,
                fit: BoxFit.contain,
              ),

              const SizedBox(height: 32),

              /// WELCOME TEXT
              const Text(
                "Welcome,",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                  color: Colors.black87,
                ),
              ),

              const SizedBox(height: 8),

              const Text(
                "Find Your\nPerfect Place..!",
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFFF6F61),
                  height: 1.2,
                ),
              ),

              const SizedBox(height: 12),

              const Text(
                "We'll Help You to Buy, Sell or Rent Your Home.",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                ),
              ),

              const Spacer(),

              /// BUILDING IMAGE
              Center(
                child: Image.asset(
                  'assets/images/building.png',
                  height: size.height * 0.35,
                  fit: BoxFit.contain,
                ),
              ),

              const Spacer(),

              /// NEXT BUTTON
              SizedBox(
                width: double.infinity,
                height: 54,
                child: ElevatedButton(
                  onPressed: () {
                    // navigation baad me add karna
                    Navigator.pushReplacementNamed(context, '/onboarding');

                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFFB3A7),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    elevation: 0,
                  ),
                  child: const Text(
                    "Next",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
