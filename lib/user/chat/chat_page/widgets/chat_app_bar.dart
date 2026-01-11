import 'package:flutter/material.dart';

class ChatAppBar extends StatelessWidget {
  const ChatAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back, color: Colors.black),
        onPressed: () {
          Navigator.pop(context); // 🔙 Back to chat list
        },
      ),
      titleSpacing: 0,
      title: Row(
        children: [
          const CircleAvatar(
            radius: 20,
            backgroundImage: AssetImage("assets/images/user1.jpg"),
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                "Ashdeep",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              Row(
                children: [
                  Icon(Icons.circle, size: 8, color: Colors.green),
                  SizedBox(width: 4),
                  Text(
                    "Online",
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.call, color: Color(0xFFFF6B6B)),
          onPressed: () {},
        )
      ],
    );
  }
}
