import 'package:flutter/material.dart';
import 'property_card.dart';

class PropertyList extends StatelessWidget {
  final int selectedTab;
  final String searchQuery;

  const PropertyList({
    super.key,
    required this.selectedTab,
    required this.searchQuery,
  });

  @override
  Widget build(BuildContext context) {
    // 0 = PG, 1 = Plots, 2 = Guest
    final List<Map<String, dynamic>> allProperties = [
      {
        "type": 0,
        "title": "Arora's House",
        "location": "New Amritsar",
        "price": "Rs 5,500/mo",
      },
      {
        "type": 1,
        "title": "Green Valley Plot",
        "location": "Airport Road",
        "price": "Rs 12,00,000",
      },
      {
        "type": 2,
        "title": "Maharani Guest House",
        "location": "Ranjit Avenue",
        "price": "Rs 2,500/night",
      },
    ];

    final filteredProperties = allProperties.where((property) {
      final matchesTab = property["type"] == selectedTab;
      final matchesSearch = property["title"].toLowerCase().contains(
        searchQuery.toLowerCase(),
      );
      return matchesTab && matchesSearch;
    }).toList();

    if (filteredProperties.isEmpty) {
      return const Center(
        child: Text("No results found", style: TextStyle(fontSize: 16)),
      );
    }

    return ListView.builder(
      itemCount: filteredProperties.length,
      itemBuilder: (context, index) {
        final item = filteredProperties[index];

        return PropertyCard(
          title: item["title"],
          address: item["location"],
          price: item["price"],
          liked: true,
        );
      },
    );
  }
}
