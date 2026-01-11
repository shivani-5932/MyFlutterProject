import 'package:flutter/material.dart';

class PropertyDocumentsScreen extends StatelessWidget {
  const PropertyDocumentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Property Documents"),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Upload Property Documents For",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 4),
            const Text(
              "Verification",
              style: TextStyle(color: Colors.green),
            ),

            const SizedBox(height: 20),

            const Text("Upload Registry Documents"),
            const SizedBox(height: 10),
            _uploadCard(title: "Front"),

            const SizedBox(height: 20),

            const Text("Upload NOC Documents"),
            const SizedBox(height: 10),
            _uploadCard(title: "Back"),

            const Spacer(),

            _submitButton("Submit"),
          ],
        ),
      ),
    );
  }

  Widget _uploadCard({required String title}) {
    return Container(
      height: 150,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 42,
            width: 42,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: const Color(0xffFF9A8B)),
            ),
            child: const Icon(Icons.add, color: Color(0xffFF9A8B)),
          ),
          const Spacer(),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 10),
            decoration: const BoxDecoration(
              color: Color(0xffFF9A8B),
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(16),
              ),
            ),
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }

  Widget _submitButton(String text) {
    return Container(
      height: 54,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        gradient: const LinearGradient(
          colors: [Color(0xffFF9A8B), Color(0xffFF6A88)],
        ),
      ),
      child: Center(
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
