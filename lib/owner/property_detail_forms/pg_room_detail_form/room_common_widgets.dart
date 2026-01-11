import 'package:flutter/material.dart';

const peach = Color(0xFFFFB3A7);
const border = Color(0xFFFFD2CC);

Widget commonScaffold({
  required String title,
  required List<Widget> children,
}) {
  return Scaffold(
    backgroundColor: Colors.grey.shade700,
    appBar: AppBar(
      title: Text(title),
      backgroundColor: peach,
    ),
    body: Padding(
      padding: const EdgeInsets.all(16),
      child: SingleChildScrollView(
        child: Column(children: children),
      ),
    ),
  );
}

Widget roomInput(String hint) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 12),
    child: TextField(
      keyboardType: TextInputType.number,
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

Widget priceCard(String title) {
  return Container(
    margin: const EdgeInsets.only(bottom: 12),
    padding: const EdgeInsets.all(12),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10),
      border: Border.all(color: border),
    ),
    child: Column(
      children: [
        Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
        const SizedBox(height: 8),
        roomInput("Rent"),
        roomInput("Advance Deposit"),
      ],
    ),
  );
}

Widget uploadButton() {
  return Container(
    margin: const EdgeInsets.symmetric(vertical: 12),
    width: double.infinity,
    height: 48,
    child: ElevatedButton.icon(
      onPressed: () {},
      icon: const Icon(Icons.add),
      label: const Text("Upload Room Photos"),
      style: ElevatedButton.styleFrom(
        backgroundColor: peach,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    ),
  );
}

Widget doneButton() {
  return SizedBox(
    width: double.infinity,
    height: 48,
    child: ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: peach,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      child: const Text("Done"),
    ),
  );
}
