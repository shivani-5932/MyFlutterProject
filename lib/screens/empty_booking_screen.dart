import 'package:flutter/material.dart';

class EmptyBookingScreen extends StatelessWidget {
  const EmptyBookingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("My Booking")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(Icons.sentiment_dissatisfied, size: 90),
          SizedBox(height: 10),
          Text("You have no Upcoming booking !"),
        ],
      ),
    );
  }
}
