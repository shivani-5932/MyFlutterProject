import 'package:flutter/material.dart';

class HotelRoomDetailsScreen extends StatelessWidget {
  const HotelRoomDetailsScreen({super.key});

  static const Color peach = Color(0xFFFFB3A7);
  static const Color border = Color(0xFFFFD2CC);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade700,
      appBar: AppBar(
        title: const Text("Hotel Room Details"),
        backgroundColor: peach,
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              children: [

                /// PROPERTY DETAILS
                inputField("Enter Name of your Property"),
                inputField("Enter Location of Property"),
                inputField("Enter Local Landmark (optional)"),

                const SizedBox(height: 12),

                /// HOTEL ROOM DETAILS
                card(
                  title: "Hotel Room Details",
                  children: [
                    rowInput("Total Rooms"),
                    rowInput("AC Rooms"),
                    rowInput("Non AC Rooms"),
                  ],
                ),

                const SizedBox(height: 12),

                /// STAY PRICING
                card(
                  title: "Stay Pricing (Per Night)",
                  children: [
                    pricingRow("Standard Room"),
                    pricingRow("Deluxe Room"),
                    pricingRow("Suite"),
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

                const SizedBox(height: 16),

                /// UPLOAD ROOM PHOTOS
                actionButton(
                  icon: Icons.add,
                  text: "Upload Room Photos",
                  onTap: () {},
                ),

                const SizedBox(height: 12),

                /// DESCRIPTION
                inputField(
                  "Enter more description about Rooms and Hotel",
                  maxLines: 3,
                ),

                const SizedBox(height: 12),

                /// FOOD AVAILABLE
                card(
                  title: "Food is available?",
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text("Yes"),
                        Text("No"),
                      ],
                    ),
                  ],
                ),

                const SizedBox(height: 12),

                /// UPLOAD FOOD MENU (OPTIONAL)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Optional",
                      style: TextStyle(color: peach, fontSize: 12),
                    ),
                    const SizedBox(height: 8),
                    actionButton(
                      icon: Icons.add,
                      text: "Upload Food Menu",
                      onTap: () {},
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                /// DONE BUTTON
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {Navigator.pushNamed(context, '/verification');},
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
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // ---------------- REUSABLE WIDGETS ----------------

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
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 8),
          ...children,
        ],
      ),
    );
  }

  Widget rowInput(String label) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label),
          SizedBox(
            width: 80,
            child: TextField(
              keyboardType: TextInputType.number,
              decoration: inputDecoration(),
            ),
          ),
        ],
      ),
    );
  }

  Widget pricingRow(String title) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title),
            SizedBox(
              width: 80,
              child: TextField(
                keyboardType: TextInputType.number,
                decoration: inputDecoration(hint: "Rs"),
              ),
            ),
          ],
        ),
        const SizedBox(height: 6),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("Advance Deposit"),
            SizedBox(
              width: 80,
              child: TextField(
                keyboardType: TextInputType.number,
                decoration: inputDecoration(hint: "Rs"),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
      ],
    );
  }

  Widget facility(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.check_circle, size: 16, color: Color(0xFFFFB3A7)),
          const SizedBox(width: 6),
          Flexible(
            child: Text(
              text,
              style: const TextStyle(fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }


  Widget actionButton({
    required IconData icon,
    required String text,
    required VoidCallback onTap,
  }) {
    return SizedBox(
      width: double.infinity,
      height: 48,
      child: ElevatedButton.icon(
        onPressed: onTap,
        icon: Icon(icon),
        label: Text(text),
        style: ElevatedButton.styleFrom(
          backgroundColor: peach,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          elevation: 0,
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
}
