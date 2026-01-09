import 'package:flutter/material.dart';
import 'package:one_roof/user/bookings/booking_card_widget.dart';
import 'package:one_roof/user/navigation/bottom_nav.dart';

class BookingScreen extends StatelessWidget {
  const BookingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      /// 🔽 BOTTOM NAV already exists in main layout
      bottomNavigationBar: const BottomNav(),
      body: SafeArea(
        child: Column(
          children: [
            /// 🔝 APP BAR
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    "My Booking",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 10),

            /// 📃 BOOKING LIST
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: const [
                  BookingCard(
                    image: "assets/images/pg_room_images/pg1.jpg",
                    title: "Arora's House",
                    location: "New Amritsar",
                    price: "Rs 5,500/month",
                    status: "Booked",
                  ),
                  BookingCard(
                    image: "assets/images/pg_room_images/pg2.jpg",
                    title: "Maharani Guest House",
                    location: "Ranjit Avenue",
                    price: "Rs 2,500/night",
                    status: "Cancelled",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
