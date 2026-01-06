import 'package:flutter/material.dart';

class GuestRoomDetailsScreen extends StatelessWidget {
  const GuestRoomDetailsScreen({super.key});

  static const peach = Color(0xFFFFB3A7);
  static const border = Color(0xFFFFD2CC);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade700,
      appBar: AppBar(
        title: const Text("Guest Room Details"),
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
                inputField("Property Name"),
                inputField("Location"),
                inputField("Local Landmark (optional)"),

                const SizedBox(height: 12),

                /// GUEST ROOM DETAILS CARD
                card(
                  title: "Guest Room Details",
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
                    pricingRow("Single Room"),
                    pricingRow("Double Room"),
                    pricingRow("Family Room"),
                  ],
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
      ),
    );
  }

  // ---------------- WIDGETS ----------------

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
          Text(title,
              style:
              const TextStyle(fontWeight: FontWeight.w600, fontSize: 14)),
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
          )
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
            )
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
            )
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
