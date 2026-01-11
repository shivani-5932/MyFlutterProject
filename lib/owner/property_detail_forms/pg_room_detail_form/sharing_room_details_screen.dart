import 'package:flutter/material.dart';
import 'package:one_roof/owner/property_detail_forms/pg_room_detail_form/room_common_widgets.dart';

class SharingRoomScreen extends StatelessWidget {
  const SharingRoomScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return commonScaffold(
      title: "Sharing Room Details",
      children: [
        roomInput("Total Sharing Rooms"),
        roomInput("AC Rooms"),
        roomInput("Non AC Rooms"),

        priceCard("Single Room"),
        priceCard("Double Room"),
        priceCard("Triple Room"),
        priceCard("Quad Room (Optional)"),

        uploadButton(),
        doneButton(),
      ],
    );
  }
}
