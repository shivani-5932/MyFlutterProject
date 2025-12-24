import 'package:flutter/material.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const peachColor = Color(0xFFFF9C8B);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Top part with light background color and logo
            Container(
              width: double.infinity,
              color: const Color(0xFFFFF7E8), // halki cream / yellow-ish
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Row(
                children: [
                  // Small logo
                  Image.asset(
                    'assets/images/home_image.png',
                    height: 40,
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    'One Roof',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: peachColor,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 32),

            // Heading
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                'Find your Perfect\nPlace',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 28,
                  height: 1.3,
                  fontWeight: FontWeight.w700,
                  color: Colors.black87,
                ),
              ),
            ),

            const SizedBox(height: 16),

            // Subheading
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 32),
              child: Text(
                'Search & Rent the best PGs,\nHotels and Plots easily',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  height: 1.5,
                  color: Colors.black54,
                ),
              ),
            ),

            const SizedBox(height: 24),

            // Illustration
            Expanded(
              child: Center(
                child: Image.asset(
                  'assets/images/onboarding_house.png',
                  width: 260,
                  fit: BoxFit.contain,
                ),
              ),
            ),

            // Get Started button
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 0, 24, 32),
              child: SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: () {
                    // yahan se next screen pe navigate karenge
                    // abhi ke liye sirf print ya TODO rakho
                    // TODO: Navigate to next screen
                    Navigator.pushReplacementNamed(context, '/welcome');
                  },
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(28),
                    ),
                    padding: EdgeInsets.zero,
                    backgroundColor: peachColor,
                  ),
                  child: const Text(
                    'Get Started',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
