import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery
        .of(context)
        .size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16), // ✅ 16px padding
          child: Column(
            children: [

              /// SKIP BUTTON
              Align(
                alignment: Alignment.topRight,
                child: TextButton(
                  onPressed: () {
                    // skip navigation
                  },
                  child: const Text(
                    "Skip",
                    style: TextStyle(color: Colors.black54),
                  ),
                ),
              ),

              Expanded(
                child: PageView(
                  controller: _controller,
                  onPageChanged: (index) {
                    setState(() => currentIndex = index);
                  },
                  children: [

                    /// PAGE 1
                    onboardingPage(
                      size,
                      image1: 'assets/images/onboard1.png',
                      // image2: 'assets/images/onboard1_b.png',
                      title: "Direct Contact with\nquick response",
                      subtitle:
                      "Simplify the property booking process\nunder One Roof",
                    ),

                    /// PAGE 2
                    onboardingPage(
                      size,
                      image1: 'assets/images/onboard2.png',
                      // image2: 'assets/images/onboard2_b.png',
                      title: "Verified listings with\nreal Photos",
                      subtitle:
                      "Just search and select your favorite\nproperty you want to locate",
                    ),
                  ],
                ),
              ),

              /// DOT INDICATOR
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  2,
                      (index) =>
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        height: 8,
                        width: currentIndex == index ? 24 : 8,
                        decoration: BoxDecoration(
                          color: currentIndex == index
                              ? const Color(0xFFFF6F61)
                              : Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                ),
              ),

              const SizedBox(height: 24),

              /// NEXT / GET STARTED BUTTON
              SizedBox(
                width: double.infinity,
                height: 54,
                child: ElevatedButton(
                  onPressed: () {
                    if (currentIndex == 0) {
                      _controller.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.ease,
                      );
                    } else {
                      // navigate to sign in / choose role
                      Navigator.pushReplacementNamed(context, '/signup');

                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFFB3A7),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    elevation: 0,
                  ),
                  child: Text(
                    currentIndex == 0 ? "Next" : "Get Started",
                    style: const TextStyle(
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

  // /// REUSABLE PAGE WIDGET
  // Widget onboardingPage(
  //     Size size, {
  //       required String image1,
  //       required String image2,
  //       required String title,
  //       required String subtitle,
  //     }) {
  //   return Column(
  //     children: [
  //
  //       const SizedBox(height: 24),
  //
  //       /// IMAGES
  //       SizedBox(
  //         height: size.height * 0.45,
  //         child: Stack(
  //           alignment: Alignment.center,
  //           children: [
  //             Positioned(
  //               left: 0,
  //               child: ClipRRect(
  //                 borderRadius: BorderRadius.circular(100),
  //                 child: Image.asset(
  //                   image1,
  //                   height: 280,
  //                   width: 180,
  //                   fit: BoxFit.cover,
  //                 ),
  //               ),
  //             ),
  //             Positioned(
  //               right: 0,
  //               child: ClipRRect(
  //                 borderRadius: BorderRadius.circular(100),
  //                 child: Image.asset(
  //                   image2,
  //                   height: 280,
  //                   width: 180,
  //                   fit: BoxFit.cover,
  //                 ),
  //               ),
  //             ),
  //           ],
  //         ),
  //       ),
  //
  //       const SizedBox(height: 32),
//
//         /// TITLE
//         Text(
//           title,
//           textAlign: TextAlign.center,
//           style: const TextStyle(
//             fontSize: 24,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//
//         const SizedBox(height: 12),
//
//         /// SUBTITLE
//         Text(
//           subtitle,
//           textAlign: TextAlign.center,
//           style: const TextStyle(
//             fontSize: 14,
//             color: Colors.black54,
//           ),
//         ),
//       ],
//     );
//   }
// }
  /// REUSABLE PAGE WIDGET (UPDATED – SINGLE IMAGE)
  Widget onboardingPage(Size size, {
    required String image1,
    required String title,
    required String subtitle,
  }) {
    return Column(
      children: [
        const SizedBox(height: 24),

        /// SINGLE IMAGE (NO SHAPE, NO OVERLAP)
        SizedBox(
          height: size.height * 0.45,
          width: double.infinity,
          child: Image.asset(
            image1,
            fit: BoxFit.contain,
          ),
        ),

        const SizedBox(height: 32),

        /// TITLE
        Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(height: 12),

        /// SUBTITLE
        Text(
          subtitle,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.black54,
          ),
        ),
      ],
    );
  }
}