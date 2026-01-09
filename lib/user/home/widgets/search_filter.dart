import 'package:flutter/material.dart';

class SearchFilterBar extends StatelessWidget {
  const SearchFilterBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          /// SEARCH TEXTFIELD
          Expanded(
            child: Container(
              height: 52,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                border: Border.all(
                  color: const Color(0xFFFF6B6B), // exact red tone
                  width: 1,
                ),
              ),
              child: TextField(
                cursorColor: const Color(0xFFFF6B6B),
                decoration: const InputDecoration(
                  hintText: 'Search "PG", "Hotels", "Guest Rooms"',
                  hintStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                  prefixIcon: Icon(
                    Icons.search,
                    color: Color(0xFFFF6B6B),
                  ),
                  border: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 14,
                    horizontal: 0,
                  ),
                ),
                onTap: () {
                  // sirf UI ke liye, backend baad mein
                },
              ),
            ),
          ),

          const SizedBox(width: 12),

          /// FILTER BUTTON
          Container(
            height: 52,
            width: 52,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: const Color(0xFFFF6B6B),
                width: 1,
              ),
            ),
            child: IconButton(
              icon: const Icon(
                Icons.tune,
                color: Color(0xFFFF6B6B),
              ),
              onPressed: () {
                // TODO: open filter bottom sheet later
              },
            ),
          ),
        ],
      ),
    );
  }
}
