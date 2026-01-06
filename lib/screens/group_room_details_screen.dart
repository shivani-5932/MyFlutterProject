import 'package:flutter/material.dart';
import 'package:one_roof/screens/room_common_widgets.dart';

class GroupRoomScreen extends StatelessWidget {
  const GroupRoomScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return commonScaffold(
      title: "Group Room Details",
      children: [
        roomInput("Total Group Rooms"),
        roomInput("AC Rooms"),
        roomInput("Non AC Rooms"),

        priceCard("2 Persons Room"),
        priceCard("3 Persons Room"),
        priceCard("4 Persons Room"),
        priceCard("5+ Persons Room"),

        uploadButton(),
        doneButton(),
      ],
    );
  }
}
