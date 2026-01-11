import 'package:flutter/material.dart';

void showMoreSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (_) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: const Icon(Icons.notifications_off),
            title: const Text("Mute Chat"),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.push_pin),
            title: const Text("Pin Chat"),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.report),
            title: const Text("Report"),
            onTap: () {},
          ),
        ],
      );
    },
  );
}
