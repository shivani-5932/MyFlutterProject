import 'package:flutter/material.dart';

class ChooseRoleScreen extends StatelessWidget {
  const ChooseRoleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Padding(padding:EdgeInsets.all(20),
                      child: const SizedBox(height: 30)),
              Image.asset(
                'assets/images/one_roof_logo.png',
                height: 40,
              ),


              /// APP NAME
              const Text(
                'One Roof',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFFF28B82),
                ),
              ),
          ],
              ),

              const SizedBox(height: 30),

              /// ILLUSTRATION
              Center(
                child: Image.asset(
                  'assets/images/choose_role.png', // illustration yahan rakho
                  height: 200,
                ),
              ),

              const SizedBox(height: 30),

              /// TITLE
              const Text(
                'What are you looking for ?',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 25),

              /// OPTION 1
              optionCard(
                icon: Icons.search,
                title: "I'm Looking for Stay",
                subtitle: "Find a PG, Hotel Room, Guest Room",
                onTap: () {},
              ),

              const SizedBox(height: 15),

              /// OPTION 2
              optionCard(
                icon: Icons.search,
                title: "I'm Looking for Property",
                subtitle: "Find Plot",
                onTap: () {

                    Navigator.pushNamed(context, '/ownerDashboard');
                  },
              ),

              const SizedBox(height: 20),

              /// SELL / RENT BUTTON
              Container(
                width: double.infinity,
                height: 70,
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  color: const Color(0xFFFFB199),
                ),
                child: InkWell(
                  borderRadius: BorderRadius.circular(14),
                  onTap: () {
                      Navigator.pushNamed(context, '/listingsDashboard');
                    },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children:  [
                      Container(
                          height: 45,
                          width: 45,
                          decoration: BoxDecoration(
                            color: const Color(0xFFFFE5E0),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Icon(Icons.add, color: Colors.white)),
                      SizedBox(width: 10),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'I Want to Sell or Rent',
                            style: TextStyle(
                              // color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            'List your PG, Plot, Hotel or Property',
                            style: TextStyle(
                              color: Colors.grey.shade600,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// OPTION CARD WIDGET
  Widget optionCard({
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return InkWell(
      borderRadius: BorderRadius.circular(14),
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: Row(
          children: [
            Container(
              height: 45,
              width: 45,
              decoration: BoxDecoration(
                color: const Color(0xFFFFE5E0),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(icon, color: Color(0xFFF28B82)),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey.shade600,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
