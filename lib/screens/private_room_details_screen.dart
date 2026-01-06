import 'package:flutter/material.dart';
import 'package:one_roof/screens/room_common_widgets.dart';

class PrivateRoomScreen extends StatelessWidget {
  const PrivateRoomScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return commonScaffold(
      title: "Private Room Details",
      children: [
        roomInput("Total Private Rooms"),
        roomInput("AC Rooms"),
        roomInput("Non AC Rooms"),
        roomInput("Attached Bathroom (Yes / No)"),

        roomInput("Monthly Rent"),
        roomInput("Advance Deposit"),

        uploadButton(),
        doneButton(),
      ],
    );
  }
}
