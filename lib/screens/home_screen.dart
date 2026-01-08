import 'package:flutter/material.dart';
import 'package:one_roof/widgets/app_header.dart';
import 'package:one_roof/widgets/category_tabs.dart';
import 'package:one_roof/widgets/property_list.dart';
import 'package:one_roof/widgets/search_filter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedTab = 0;
  String searchQuery = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF7F7),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Center(
              child: Container(
                // 👇 This keeps mobile UI nice but allows web to expand
                width: constraints.maxWidth > 600 ? 430 : constraints.maxWidth,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppHeader(location: "Sharifpura, Asr"),
                    const SizedBox(height: 12),
                    SearchFilter(
                      onChanged: (value) {
                        setState(() {
                          searchQuery = value;
                        });
                      },
                    ),
                    const SizedBox(height: 12),
                    CategoryTabs(
                      selectedIndex: selectedTab,
                      onChanged: (index) {
                        setState(() {
                          selectedTab = index;
                        });
                      },
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      "Near By Your location",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Expanded(
                      child: PropertyList(
                        selectedTab: selectedTab,
                        searchQuery: searchQuery,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
