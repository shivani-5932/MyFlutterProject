import 'package:flutter/material.dart';
import 'package:one_roof/user/navigation/bottom_nav.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  Widget profileItem(IconData icon, String title, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
        child: Row(
          children: [
            CircleAvatar(
              radius: 18,
              backgroundColor: const Color(0xFFFFECEC),
              child: Icon(icon, size: 18, color: Color(0xFFFF6B6B)),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const Icon(Icons.arrow_forward_ios, size: 14, color: Colors.grey),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          "Profile",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
        ),
      ),
      /// 🔽 BOTTOM NAV
      bottomNavigationBar: const BottomNav(),
      body: Column(
        children: [
          const SizedBox(height: 24),

          /// Profile Image
          Stack(
            children: [
              const CircleAvatar(
                radius: 48,
                backgroundImage: AssetImage("assets/images/profile.jpg"),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: CircleAvatar(
                  radius: 14,
                  backgroundColor: Color(0xFFFF6B6B),
                  child: const Icon(Icons.edit, size: 14, color: Colors.white),
                ),
              )
            ],
          ),

          const SizedBox(height: 12),

          /// Name
          const Text(
            "Varun Arora",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),

          const SizedBox(height: 4),

          /// Email
          const Text(
            "varun@gmail.com",
            style: TextStyle(fontSize: 13, color: Colors.grey),
          ),

          const SizedBox(height: 6),

          /// Edit text
          InkWell(
            child: const Text(
              "Edit",
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w700,
                color: Color(0xFFFF6B6B),
              ),
            ),
            onTap: (){Navigator.pushReplacementNamed(context, '/editProfile');},
          ),

          const SizedBox(height: 30),

          profileItem(Icons.settings, "Settings", () {}),
          profileItem(Icons.credit_card, "Payment", () {}),
          profileItem(Icons.notifications, "Notification", () {}),
          profileItem(Icons.history, "Recent Viewed", () {}),
          profileItem(Icons.info_outline, "About", () {}),

          const Spacer(),

          /// Logout
          Padding(
            padding: const EdgeInsets.only(bottom: 30),
            child: GestureDetector(
              onTap: () {},
              child: const Text(
                "Log Out",
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
