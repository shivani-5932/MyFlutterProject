import 'package:flutter/material.dart';

class AppHeader extends StatelessWidget {
  final String location;

  const AppHeader({super.key, required this.location});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 379,
      height: 46,
      margin: const EdgeInsets.only(top: 70, left: 17, right: 17),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const Icon(Icons.location_on, color: Colors.red, size: 18),
              const SizedBox(width: 4),
              Text(
                location,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          Row(
            children: const [
              CircleAvatar(
                radius: 18,
                backgroundColor: Colors.white,
                child: Icon(Icons.notifications_none),
              ),
              SizedBox(width: 10),
              CircleAvatar(
                radius: 18,
                backgroundColor: Colors.white,
                child: Icon(Icons.chat_bubble_outline),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
