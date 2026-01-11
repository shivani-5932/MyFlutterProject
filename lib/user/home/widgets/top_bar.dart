import 'package:flutter/material.dart';

class TopBar extends StatefulWidget {
  const TopBar({super.key});

  @override
  State<TopBar> createState() => _TopBarState();
}

class _TopBarState extends State<TopBar> {
  String selectedLocation = "Sharifpura, Asr";

  final List<String> locations = [
    "Sharifpura, Asr",
    "Ranjit Avenue, Asr",
    "Mall Road, Asr",
    "Lawrence Road, Asr",
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Row(
        children: [
          /// LOCATION ICON
          const Icon(
            Icons.location_on_outlined,
            color: Colors.black,
          ),
          const SizedBox(width: 6),

          /// LOCATION + DROPDOWN
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Location",
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                ),
              ),
              GestureDetector(
                onTap: () {
                  _showLocationSheet(context);
                },
                child: Row(
                  children: [
                    Text(
                      selectedLocation,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(width: 4),
                    const Icon(
                      Icons.keyboard_arrow_down,
                      size: 20,
                    )
                  ],
                ),
              )
            ],
          ),

          const Spacer(),

          /// NOTIFICATION ICON
          _circleIcon(
            icon: Icons.notifications_none,
            onTap: () {
              // TODO: Notification screen
              debugPrint("Notification clicked");
            },
          ),

          const SizedBox(width: 10),

          /// CHAT ICON
          _circleIcon(
            icon: Icons.chat_bubble_outline,
            onTap: () {
              // TODO: Chat screen
              Navigator.pushReplacementNamed(context, '/chatList');
              debugPrint("Chat clicked");
            },
          ),
        ],
      ),
    );
  }

  /// CIRCULAR ICON BUTTON
  Widget _circleIcon({
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(50),
      child: Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300),
          shape: BoxShape.circle,
        ),
        child: Icon(icon, size: 20),
      ),
    );
  }

  /// LOCATION BOTTOM SHEET
  void _showLocationSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) {
        return ListView(
          padding: const EdgeInsets.all(16),
          children: locations.map((location) {
            return ListTile(
              title: Text(location),
              trailing: location == selectedLocation
                  ? const Icon(Icons.check, color: Colors.green)
                  : null,
              onTap: () {
                setState(() {
                  selectedLocation = location;
                });
                Navigator.pop(context);
              },
            );
          }).toList(),
        );
      },
    );
  }
}
