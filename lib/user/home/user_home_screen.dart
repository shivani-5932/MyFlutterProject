import 'package:flutter/material.dart';
import 'package:one_roof/user/navigation/bottom_nav.dart';
import 'package:one_roof/user/home/tabs/pg_tab.dart';
import 'package:one_roof/user/home/tabs/guest_tab.dart';
import 'package:one_roof/user/home/tabs/hotel_tab.dart';
import 'widgets/top_bar.dart';
import 'widgets/search_filter.dart';
import 'widgets/category_section.dart';

class UserHomeScreen extends StatefulWidget {
  const UserHomeScreen({super.key});

  @override
  State<UserHomeScreen> createState() => _UserHomeScreenState();
}

class _UserHomeScreenState extends State<UserHomeScreen> {
  int selectedCategory = 0; // 0=PG, 1=Hotel, 2=Guest
  String searchQuery = ''; // ✅ ADD THIS

  Widget getSelectedTab() {
    if (selectedCategory == 0) return PGTab(searchQuery: searchQuery);
    if (selectedCategory == 1) return HotelTab(searchQuery: searchQuery);
    return GuestTab(searchQuery: searchQuery);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,

      /// 🔽 BOTTOM NAV
      bottomNavigationBar: const BottomNav(),

      body: SafeArea(
        child: Column(
          children: [
            /// 🔝 TOP BAR
            const TopBar(),

            /// 🔍 SEARCH + FILTER
            SearchFilterBar(
              onChanged: (value) {
                setState(() {
                  searchQuery = value.toLowerCase();
                });
              },
            ),

            /// 🏠 CATEGORY
            CategorySection(
              selectedIndex: selectedCategory,
              onTap: (index) {
                setState(() {
                  selectedCategory = index;
                });
              },
            ),

            /// 📃 CONTENT (PG / HOTEL / GUEST)
            Expanded(child: getSelectedTab()),
          ],
        ),
      ),
    );
  }
}
