import 'package:flutter/material.dart';

class SelectPropertyScreen extends StatefulWidget {
  const SelectPropertyScreen({super.key});

  @override
  State<SelectPropertyScreen> createState() =>
      _SelectPropertyScreenState();
}

class _SelectPropertyScreenState extends State<SelectPropertyScreen> {
  String selectedValue = "Choose";

  final List<String> propertyTypes = [
    "Choose",
    "PG Room",
    "Hotel Room",
    "Guest Room",
    "Plot",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: const Text("Select Property to Upload"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(height: 10),

            // IMAGE
            Image.asset(
              "assets/images/property.png",
              height: 220,
            ),

            const SizedBox(height: 20),

            // TITLE
            const Text(
              "Enter Property Details",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 6),

            const Text(
              "Choose PG, Hotel Room, Guest Room or Plot",
              style: TextStyle(color: Colors.grey),
            ),

            const SizedBox(height: 24),

            // DROPDOWN
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey.shade400),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: selectedValue,
                  isExpanded: true,
                  icon: const Icon(Icons.keyboard_arrow_down),
                  items: propertyTypes.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: TextStyle(
                          color: value == "Choose"
                              ? Colors.grey
                              : Colors.black,
                        ),
                      ),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedValue = newValue!;
                    });
                  },
                ),
              ),
            ),

            const Spacer(),

            // NEXT BUTTON
            Container(
              height: 56,
              width: double.infinity,
              margin: const EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                gradient: const LinearGradient(
                  colors: [
                    Color(0xffFF9A8B),
                    Color(0xffFF6A88),
                  ],
                ),
              ),
              child:  Center(
                child: InkWell(
                  onTap: () {
                    if (selectedValue == "PG Room") {
                      Navigator.pushNamed(context, '/pgDetails');
                    }
                    else if (selectedValue == "Hotel Room") {
                      Navigator.pushNamed(context, '/hotelDetails');
                    }
                    else if (selectedValue == "Guest Room") {
                      Navigator.pushNamed(context, '/guestDetails');
                    }
                    else if (selectedValue == "Plot") {
                      // abhi kuch nahi karega
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Plot details coming soon")),
                      );
                    }
                    else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Please select a property type")),
                      );
                    }
                  },

                  child: Text(
                    "Next",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
