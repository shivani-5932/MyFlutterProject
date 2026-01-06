import 'package:flutter/material.dart';
import 'sharing_room_details_screen.dart';
import 'group_room_details_screen.dart';
import 'private_room_details_screen.dart';

const peach = Color(0xFFFFB3A7);
const border = Color(0xFFFFD2CC);

class PgDetailsMainScreen extends StatelessWidget {
  const PgDetailsMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade700,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [

              buildInput("Property Name"),
              buildInput("Location"),
              buildInput("Local Landmark (optional)"),

              const SizedBox(height: 12),

              buildOptionCard(
                context,
                title: "Sharing Room",
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const SharingRoomScreen()),
                ),
              ),

              buildOptionCard(
                context,
                title: "Group Room",
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const GroupRoomScreen()),
                ),
              ),

              buildOptionCard(
                context,
                title: "Private Room",
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const PrivateRoomScreen()),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildInput(String hint) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: TextField(
        decoration: InputDecoration(
          hintText: hint,
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: border),
          ),
        ),
      ),
    );
  }

  Widget buildOptionCard(BuildContext context,
      {required String title, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(top: 12),
        padding: const EdgeInsets.all(16),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: peach),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
          title,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
