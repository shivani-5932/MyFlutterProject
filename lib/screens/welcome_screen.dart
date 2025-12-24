import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const peachColor = Color(0xFFFF9C8B);
    const darkPeach = Color(0xFFFF7A5C);
    const bgColor = Color(0xFFFFBFA8);

    return Scaffold(
      body:
       Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFFFFBFA8),
              Color(0xFFFF9C8B),
            ],
          ),
        ),
        child: Stack(
          children: [
            Padding( padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                child: const SizedBox(height: 30)),
            
            /// LOGO + APP NAME
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
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
                    color: Color(0xFFF28B82),
                  ),
                ),
              ],
            ),
            // Background circles
            Positioned(
              top: -80,
              left: -40,
              child: _Bubble(
                diameter: 220,
                color: Colors.white.withOpacity(0.25),
              ),
            ),
            Positioned(
              top: 40,
              right: -60,
              child: _Bubble(
                diameter: 260,
                color: Colors.white.withOpacity(0.22),
              ),
            ),

            // Content
            SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const SizedBox(height: 80),
                  const Spacer(),
                  const Text(
                    'Welcome !',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 40),

                  // Sign in button
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32),
                    child: SizedBox(
                      width: double.infinity,
                      height: 56,
                      child: ElevatedButton(
                        onPressed: () {
                          // TODO: Navigate to Sign in screen
                          Navigator.pushNamed(context, '/signin');
                        },
                        style: ElevatedButton.styleFrom(
                          elevation: 4,
                          backgroundColor: darkPeach,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          shadowColor: Colors.black26,
                        ),
                        child: const Text(
                          'Sign in',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 24),

                  // Create account text button
                  TextButton(
                    onPressed: () {
                      // TODO: Navigate to Create account screen
                      Navigator.pushNamed(context, '/signup');

                    },
                    child: const Text(
                      'Create an account',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ),

                  const SizedBox(height: 64),
                ],
              ),
            ),
          ],
        ),
      ),

    );
  }
}

// Background bubble widget
class _Bubble extends StatelessWidget {
  final double diameter;
  final Color color;

  const _Bubble({
    required this.diameter,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: diameter,
      height: diameter,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
        border: Border.all(
          color: Colors.white.withOpacity(0.5),
          width: 3,
        ),
      ),
    );
  }
}
