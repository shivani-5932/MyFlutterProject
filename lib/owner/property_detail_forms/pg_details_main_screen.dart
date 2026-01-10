import 'package:flutter/material.dart';
import 'pg_room_detail_form/sharing_room_details_screen.dart';
import 'pg_room_detail_form/group_room_details_screen.dart';
import 'pg_room_detail_form/private_room_details_screen.dart';

const peach = Color(0xFFFFB3A7);
const border = Color(0xFFFFD2CC);

class PgDetailsMainScreen extends StatelessWidget {
  const PgDetailsMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade700,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [

              buildInput("Property Name"),
              buildInput("Location"),
              buildInput("Local Landmark (optional)"),

              const SizedBox(height: 12),

              buildOptionCard(
                context,
                title: "Sharing Room",
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const SharingRoomScreen()),
                ),
              ),

              buildOptionCard(
                context,
                title: "Group Room",
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const GroupRoomScreen()),
                ),
              ),

              buildOptionCard(
                context,
                title: "Private Room",
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const PrivateRoomScreen()),
                ),
              ),
              const SizedBox(height: 12),

              /// VISIT CHARGES
              card(
                title: "Visit Charges (Optional)",
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Visit Fee"),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: peach,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Text(
                          "Rs 199",
                          style: TextStyle(color: Colors.white),
                        ),
                      )
                    ],
                  ),
                ],
              ),

              const SizedBox(height: 12),

              /// FACILITIES
              card(
                title: "Facilities",
                children: [
                  facility("Attached Balcony"),
                  facility("Attached Bathroom"),
                  facility("24 hour water supply"),
                  facility("Parking"),
                  facility("Free Wifi"),
                  facility("Add More"),
                ],
              ),

              const SizedBox(height: 12),

              /// DESCRIPTION
              inputField(
                "Enter more description about house and rules",
                maxLines: 3,
              ),

              const SizedBox(height: 12),

              /// KITCHEN OPTIONS
              card(
                title: "Kitchen is available?",
                children: [
                  optionRow("Common Kitchen"),
                  optionRow("Private Kitchen"),
                ],
              ),

              const SizedBox(height: 16),

              /// UPLOAD PHOTOS
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.add),
                  label: const Text("Upload Room Photos"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: peach,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    elevation: 0,
                  ),
                ),
              ),

              const SizedBox(height: 16),

              /// DONE BUTTON
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/verification');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: peach,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    elevation: 0,
                  ),
                  child: const Text(
                    "Done",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );

  }




  Widget buildInput(String hint) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: TextField(
        decoration: InputDecoration(
          hintText: hint,
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: border),
          ),
        ),
      ),
    );
  }

  Widget buildOptionCard(BuildContext context,
      {required String title, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(top: 12),
        padding: const EdgeInsets.all(16),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: peach),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
          title,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}

Widget card({required String title, required List<Widget> children}) {
  return Container(
    width: double.infinity,
    padding: const EdgeInsets.all(12),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,
            style:
            const TextStyle(fontWeight: FontWeight.w600, fontSize: 14)),
        const SizedBox(height: 8),
        ...children,
      ],
    ),
  );
}

Widget facility(String text) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 6),
    child: Row(
      children: [
        const Icon(Icons.check_circle, size: 16, color: peach),
        const SizedBox(width: 6),
        Text(text),
      ],
    ),
  );
}

Widget optionRow(String title) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(title),
      Row(
        children: const [
          Text("Yes"),
          SizedBox(width: 8),
          Text("No"),
        ],
      )
    ],
  );
}

Widget inputField(String hint, {int maxLines = 1}) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 12),
    child: TextField(
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: hint,
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: border),
        ),
      ),
    ),
  );
}

InputDecoration inputDecoration({String? hint}) {
  return InputDecoration(
    hintText: hint,
    isDense: true,
    filled: true,
    fillColor: Colors.white,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(color: border),
    ),
  );
}

