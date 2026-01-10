import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:one_roof/user/bookings/booking_card_widget.dart';
import 'package:one_roof/user/navigation/bottom_nav.dart';

class BookingEmptyScreen extends StatelessWidget {
  const BookingEmptyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          "My Booking",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      /// 🔽 BOTTOM NAV
      bottomNavigationBar: const BottomNav(),
      body: Column(
        children: [
          const SizedBox(height: 40),

          /// Illustration
          Image.asset(
            "assets/images/no_booking.png", // add image
            height: 260,
          ),

          const SizedBox(height: 24),

          const Text(
            "Opps!!",
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.w700,
            ),
          ),

          const SizedBox(height: 12),

          const Text(
            "You have no Upcoming booking !",
            style: TextStyle(
              fontSize: 15,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
