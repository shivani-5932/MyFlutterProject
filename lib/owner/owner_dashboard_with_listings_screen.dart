import 'package:flutter/material.dart';

class OwnerDashboardWithListings extends StatelessWidget {
  const OwnerDashboardWithListings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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

                      /// Welcome
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

                      /// Upload Button
                      InkWell(
                        onTap: (){
                            Navigator.pushNamed(context, '/selectProperty');
                          },
                        child: Container(
                          height: 60,
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
                              ),
                            ],
                          ),
                        ),
                      ),

                      const SizedBox(height: 28),

                      /// My Listings Header
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            "My Listings",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Icon(Icons.arrow_forward_ios, size: 16),
                        ],
                      ),

                      const SizedBox(height: 16),

                      /// Arora's House Card
                      _infoCard(
                        iconPath: "assets/images/house_pg.png",
                        title: "Arora’s House",
                        subtitle: "2 properties listed",
                      ),

                      const SizedBox(height: 14),

                      /// Chats Card
                      _infoCard(
                        iconPath: "assets/images/chat.png",
                        title: "Chats",
                        subtitle: "2 unread messages",
                      ),

                      const SizedBox(height: 14),

                      /// Schedule Visits Card
                      _infoCard(
                        iconPath: "assets/images/calendar.png",
                        title: "Schedule Visits",
                        subtitle: "Upcoming visits on",
                      ),

                      const SizedBox(height: 30),
                    ],
                  ),
                ),
              ),
            ),

            /// Bottom Navigation
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

  /// Listing / Chat / Schedule Card
  Widget _infoCard({
    required String iconPath,
    required String title,
    required String subtitle,
  }) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Row(
        children: [
          Image.asset(
            iconPath,
            height: 42,
            width: 42,
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 13,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          const Icon(Icons.arrow_forward_ios, size: 16),
        ],
      ),
    );
  }

  /// Bottom Nav Item
  Widget _bottomItem(IconData icon, String label, bool active) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          color: active ? Colors.white : Colors.white70,
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            color: active ? Colors.white : Colors.white70,
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}
