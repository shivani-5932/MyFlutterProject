import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:one_roof/user/bookings/booking_card_widget.dart';
import 'package:one_roof/user/navigation/bottom_nav.dart';

class MapStartScreen extends StatelessWidget {
  const MapStartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      /// 🔽 BOTTOM NAV
      bottomNavigationBar: const BottomNav(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            const Spacer(),

            /// ILLUSTRATION
            Image.asset(
              "assets/images/map_illustration.png",
              height: 220,
              fit: BoxFit.contain,
            ),

            const SizedBox(height: 32),

            /// TITLE
            const Text(
              "Hi, Nice to meet you !",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 10),

            /// SUBTITLE
            const Text(
              "Choose your location to find property\naround you",
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
              textAlign: TextAlign.center,
            ),

            const Spacer(),

            /// USE CURRENT LOCATION BUTTON
            SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFFB3A7),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  elevation: 0,
                ),
                onPressed: () {
                  // TODO: Use current location
                },
                child: const Text(
                  "Use current location",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 14),

            /// SELECT MANUALLY BUTTON
            SizedBox(
              width: double.infinity,
              height: 52,
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Color(0xFFFFB3A7)),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                onPressed: () {
                  // TODO: Select manually
                },
                child: const Text(
                  "Select it manually",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFFFF6B6B),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
