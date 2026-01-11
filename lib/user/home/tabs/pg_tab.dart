import 'package:flutter/material.dart';

class PGTab extends StatefulWidget {
  final String searchQuery;

  const PGTab({super.key, required this.searchQuery});

  @override
  State<PGTab> createState() => _PGTabState();
}

class _PGTabState extends State<PGTab> {
  final List<Map<String, dynamic>> guestList = [
    {
      "name": "Om's PG",
      "price": "Rs 5,500/night",
      "image": "assets/images/pg_room_images/pg1.jpg",
      "liked": false,
    },
    {
      "name": "Yatna's House",
      "price": "Rs 4,999/night",
      "image": "assets/images/pg_room_images/pg2.jpg",
      "liked": false,
    },
    {
      "name": "Arora's PG",
      "price": "Rs 3,999/night",
      "image": "assets/images/pg_room_images/pg3.jpg",
      "liked": false,
    },
    {
      "name": "Diamond House",
      "price": "Rs 3,999/mo",
      "image": "assets/images/pg_room_images/pg4.jpg",
      "liked": false,
    },
    {
      "name": "Kiran's house",
      "price": "Rs 7,999/mo",
      "image": "assets/images/pg_room_images/pg5.jpg",
      "liked": false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    final filteredList = guestList.where((guest) {
      return guest['name'].toLowerCase().contains(widget.searchQuery);
    }).toList();

    if (filteredList.isEmpty) {
      return const Center(child: Text("No results found"));
    }

    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      itemCount: filteredList.length,
      itemBuilder: (context, index) {
        final guest = filteredList[index];

        return GuestCard(
          name: guest['name'],
          price: guest['price'],
          image: guest['image'],
          isLiked: guest['liked'],
          onLikeTap: () {
            setState(() {
              guest['liked'] = !guest['liked'];
            });
          },
        );
      },
    );
  }
}

class GuestCard extends StatelessWidget {
  final String name;
  final String price;
  final String image;
  final bool isLiked;
  final VoidCallback onLikeTap;

  const GuestCard({
    super.key,
    required this.name,
    required this.price,
    required this.image,
    required this.isLiked,
    required this.onLikeTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 6)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// IMAGE STACK
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(18),
                ),
                child: Image.asset(
                  image,
                  height: 170,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),

              /// PRICE TAG
              Positioned(
                top: 12,
                right: 12,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFF6B6B),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    price,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),

              /// LIKE / UNLIKE
              Positioned(
                bottom: 12,
                right: 12,
                child: GestureDetector(
                  onTap: onLikeTap,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 16,
                    child: Icon(
                      isLiked ? Icons.favorite : Icons.favorite_border,
                      color: const Color(0xFFFF6B6B),
                      size: 18,
                    ),
                  ),
                ),
              ),
            ],
          ),

          /// DETAILS
          Padding(
            padding: const EdgeInsets.all(14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  "New Amritsar",
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                ),

                const SizedBox(height: 10),

                /// FEATURES
                Wrap(
                  spacing: 8,
                  runSpacing: 6,
                  children: [
                    featureChip("Attached Balcony"),
                    featureChip("Attached Washroom"),
                    featureChip("+2 more"),
                  ],
                ),

                const SizedBox(height: 14),

                /// VIEW DETAILS
                SizedBox(
                  width: double.infinity,
                  height: 42,
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Color(0xFFFF6B6B)),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                    ),
                    onPressed: () {},
                    child: const Text(
                      "View details  >",
                      style: TextStyle(
                        color: Color(0xFFFF6B6B),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget featureChip(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Text(text, style: const TextStyle(fontSize: 11)),
    );
  }
}
