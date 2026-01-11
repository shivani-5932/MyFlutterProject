import 'package:flutter/material.dart';

class SearchFilterBar extends StatelessWidget {
  final Function(String) onChanged;

  const SearchFilterBar({super.key, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              onChanged: onChanged, // ✅ KEY LINE
              decoration: InputDecoration(
                hintText: 'Search "PG", "Hotel", "Guest"',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
          ),
          const SizedBox(width: 8),
          Container(
            height: 48,
            width: 48,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: const Color(0xFF9DA4AE)),
            ),
            child: const Icon(Icons.tune),
          ),
        ],
      ),
    );
  }
}
