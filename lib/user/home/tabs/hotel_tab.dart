import 'package:flutter/material.dart';

class HotelTab extends StatefulWidget {
  const HotelTab({super.key});

  @override
  State<HotelTab> createState() => _HotelTabState();
}

class _HotelTabState extends State<HotelTab> {
  final List<Map<String, dynamic>> guestList = [
    {
      "name": "Hotel Grand",
      "price": "Rs 5,500/night",
      "image": "assets/images/hotel_room_images/hotel1.jpg",
      "liked": false,
    },
    {
      "name": "M.K Hotel",
      "price": "Rs 4,999/night",
      "image": "assets/images/hotel_room_images/hotel2.jpg",
      "liked": false,
    },
    {
      "name": "Hotel Lawrence",
      "price": "Rs 3,999/night",
      "image": "assets/images/hotel_room_images/hotel3.jpg",
      "liked": false,
    },
    {
      "name": "Diamond Hotel",
      "price": "Rs 3,999/mo",
      "image": "assets/images/hotel_room_images/hotel4.jpg",
      "liked": false,
    },
    {
      "name": "Hotel BR Grand",
      "price": "Rs 7,999/mo",
      "image": "assets/images/hotel_room_images/hotel5.jpg",
      "liked": false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      itemCount: guestList.length,
      itemBuilder: (context, index) {
        final guest = guestList[index];

        return GuestCard(
          name: guest['name'],
          price: guest['price'],
          image: guest['image'],
          isLiked: guest['liked'],
          onLikeTap: () {
            setState(() {
              guestList[index]['liked'] = !guestList[index]['liked'];
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
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 6),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          /// IMAGE STACK
          Stack(
            children: [
              ClipRRect(
                borderRadius:
                const BorderRadius.vertical(top: Radius.circular(18)),
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
                  padding:
                  const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
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
                      fontSize: 15, fontWeight: FontWeight.w600),
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
                      side:
                      const BorderSide(color: Color(0xFFFF6B6B)),
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
          )
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
