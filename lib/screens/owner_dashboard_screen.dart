import 'package:flutter/material.dart';

class OwnerDashboardScreen extends StatelessWidget {
  const OwnerDashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20),

                      /// Title
                      const Text(
                        "Owner Dashboard",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),

                      const SizedBox(height: 16),

                      /// Welcome text
                      const Text(
                        "Welcome Owner",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 6),

                      const Text(
                        "Manage your properties efficiently",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),

                      const SizedBox(height: 24),

                      /// Upload New Property Button
                      InkWell(
                        onTap: (){
                            Navigator.pushNamed(context, '/selectProperty');
                          },
                        child: Container(
                          height: 60,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            gradient: const LinearGradient(
                              colors: [
                                Color(0xFFFFB199),
                                Color(0xFFFF7A7A),
                              ],
                            ),
                          ),
                          child: Row(
                            children: [
                              const SizedBox(width: 16),
                              Container(
                                height: 38,
                                width: 38,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: const Icon(
                                  Icons.add,
                                  color: Color(0xFFFF7A7A),
                                ),
                              ),
                              const SizedBox(width: 14),
                              const Text(
                                "Upload New Property",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),

                      const SizedBox(height: 40),

                      /// Illustration
                      Center(
                        child: Image.asset(
                          "assets/images/owner_empty.png",
                          height: size.height * 0.30,
                          fit: BoxFit.contain,
                        ),
                      ),

                      const SizedBox(height: 20),

                      /// No Property Text
                      const Center(
                        child: Text(
                          "No Property Uploaded yet !",
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0xFFFF7A7A),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            /// Bottom Navigation Bar
            Container(
              height: 70,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFFFFB199),
                    Color(0xFFFF7A7A),
                  ],
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _bottomItem(Icons.bar_chart, "Dashboard", true),
                  _bottomItem(Icons.list_alt, "Listing", false),
                  _bottomItem(Icons.add_box_outlined, "SELL", false),
                  _bottomItem(Icons.person_outline, "Profile", false),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _bottomItem(IconData icon, String label, bool isActive) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          color: isActive ? Colors.white : Colors.white70,
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            color: isActive ? Colors.white : Colors.white70,
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}
