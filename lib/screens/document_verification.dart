import 'package:flutter/material.dart';

class DocumentVerification extends StatelessWidget {
  const DocumentVerification({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Verification"),
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [

            Image.asset("assets/images/verify_illustration.png", height: 200),

            const SizedBox(height: 16),

            const Text(
              "To ensure safety and trust , please\nfill the following details",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey),
            ),

            const SizedBox(height: 30),

            _optionTile(Icons.business, "Property Documents"),
            _optionTile(Icons.verified, "Verify Yourself"),
            _optionTile(Icons.receipt, "Electricity Bill", "Optional"),

            const Spacer(),

            _nextButton(),
          ],
        ),
      ),
    );
  }

  Widget _optionTile(IconData icon, String title, [String? subtitle]) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Row(
        children: [
          Icon(icon, size: 36),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style:
                    const TextStyle(fontWeight: FontWeight.bold)),
                if (subtitle != null)
                  Text(subtitle,
                      style: const TextStyle(color: Colors.grey)),
              ],
            ),
          ),
          const Icon(Icons.arrow_forward_ios, size: 16),
        ],
      ),
    );
  }

  Widget _nextButton() {
    return Container(
      height: 56,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        gradient: const LinearGradient(
          colors: [Color(0xffFF9A8B), Color(0xffFF6A88)],
        ),
      ),
      child: const Center(
        child: Text("Next",
            style: TextStyle(color: Colors.white, fontSize: 16)),
      ),
    );
  }
}
