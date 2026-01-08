import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class BookingScreen extends StatelessWidget {
  const BookingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("My Booking")),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          ListTile(
            title: const Text("Arora's House"),
            trailing: Chip(
              label: const Text("Booked"),
              backgroundColor: AppColors.booked,
            ),
          ),
          ListTile(
            title: const Text("Maharani Guest House"),
            trailing: Chip(
              label: const Text("Cancelled"),
              backgroundColor: AppColors.cancelled,
            ),
          ),
        ],
      ),
    );
  }
}
