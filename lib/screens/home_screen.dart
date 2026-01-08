import 'package:flutter/material.dart';

class PropertyModel {
  final String title;
  final String location;
  final String image;
  final String price;
  bool isLiked;

  PropertyModel({
    required this.title,
    required this.location,
    required this.image,
    required this.price,
    this.isLiked = false,
  });
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedCategory = 0;

  List<PropertyModel> pgList = [
    PropertyModel(
      title: "Arora's House",
      location: "New Amritsar",
      image: "assets/images/pg_room_images/pg1.jpg",
      price: "₹ 5,500/mo",
    ),
    PropertyModel(
      title: "Yatna's House",
      location: "New Amritsar",
      image: "assets/images/pg_room_images/pg2.jpg",
      price: "₹ 5,500/mo",
    ),
    PropertyModel(
      title: "Om's PG",
      location: "New Amritsar",
      image: "assets/images/pg_room_images/pg3.jpg",
      price: "₹ 5,500/mo",
    ),
    PropertyModel(
      title: "Ahuja's PG",
      location: "New Amritsar",
      image: "assets/images/pg_room_images/pg4.jpg",
      price: "₹ 5,500/mo",
    ),
    PropertyModel(
      title: "Kiran's House",
      location: "New Amritsar",
      image: "assets/images/pg_room_images/pg5.jpg",
      price: "₹ 5,500/mo",
    ),
  ];

  List<PropertyModel> hotelList = [
    PropertyModel(
      title: "Hotel Grand",
      location: "New Amritsar",
      image: "assets/images/hotel_room_images/hotel1.jpg",
      price: "₹ 3,500/night",
    ),
    PropertyModel(
      title: "H.K Hotel",
      location: "New Amritsar",
      image: "assets/images/hotel_room_images/hotel2.jpg",
      price: "₹ 3,500/night",
    ),
    PropertyModel(
      title: "Hotel BR Grand",
      location: "New Amritsar",
      image: "assets/images/hotel_room_images/hotel3.jpg",
      price: "₹ 3,500/night",
    ),
    PropertyModel(
      title: "Hotel Majestic",
      location: "New Amritsar",
      image: "assets/images/hotel_room_images/hotel4.jpg",
      price: "₹ 3,500/night",
    ),
    PropertyModel(
      title: " Sandoz Hotel",
      location: "New Amritsar",
      image: "assets/images/hotel_room_images/hotel5.jpg",
      price: "₹ 3,500/night",
    ),
  ];

  List<PropertyModel> guestList = [
    PropertyModel(
      title: "Maharani Guest House",
      location: "Ranjit Avenue",
      image: "assets/images/guest_room_images/guest1.jpg",
      price: "₹ 5,500/night",
    ),
    PropertyModel(
      title: "Yatna Guest House",
      location: "Ranjit Avenue",
      image: "assets/images/guest_room_images/guest2.jpg",
      price: "₹ 5,500/night",
    ),
    PropertyModel(
      title: "Rose Guest House",
      location: "Ranjit Avenue",
      image: "assets/images/guest_room_images/guest3.jpg",
      price: "₹ 5,500/night",
    ),
    PropertyModel(
      title: "Diamond Rooms",
      location: "Ranjit Avenue",
      image: "assets/images/guest_room_images/guest4.jpg",
      price: "₹ 5,500/night",
    ),
    PropertyModel(
      title: "Sofia's House",
      location: "Ranjit Avenue",
      image: "assets/images/guest5.jpg",
      price: "₹ 5,500/night",
    ),
  ];

  List<PropertyModel> get currentList {
    if (selectedCategory == 0) return pgList;
    if (selectedCategory == 1) return hotelList;
    return guestList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: bottomNav(),
      body: SafeArea(
        child: Column(
          children: [
            header(),
            categorySwitch(),
            Expanded(child: propertyList()),
          ],
        ),
      ),
    );
  }

  Widget header() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Row(
            children: const [
              Icon(Icons.location_on, color: Colors.pink),
              SizedBox(width: 6),
              Text("Sharifpura, Asr",
                  style: TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
          const SizedBox(height: 12),
          TextField(
            decoration: InputDecoration(
              hintText: 'Search "PG"',
              prefixIcon: const Icon(Icons.search),
              border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(14)),
            ),
          ),
        ],
      ),
    );
  }

  Widget categorySwitch() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: Row(
          children: [
            categoryButton("PG Room", 0),
            categoryButton("Hotel Room", 1),
            categoryButton("Guest Room", 2),
          ],
        ),
      ),
    );
  }

  Widget categoryButton(String text, int index) {
    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => selectedCategory = index),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            color: selectedCategory == index
                ? const Color(0xffFF9A8B)
                : Colors.transparent,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              color:
              selectedCategory == index ? Colors.white : Colors.black,
            ),
          ),
        ),
      ),
    );
  }

  Widget propertyList() {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: currentList.length,
      itemBuilder: (context, index) {
        return propertyCard(currentList[index]);
      },
    );
  }

  Widget propertyCard(PropertyModel item) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius:
                const BorderRadius.vertical(top: Radius.circular(16)),
                child: Image.asset(
                  item.image,
                  height: 180,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                right: 12,
                top: 12,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      item.isLiked = !item.isLiked;
                    });
                  },
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Icon(
                      item.isLiked
                          ? Icons.favorite
                          : Icons.favorite_border,
                      color: Colors.pink,
                    ),
                  ),
                ),
              ),
              Positioned(
                right: 12,
                bottom: 12,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10, vertical: 6),
                  decoration: BoxDecoration(
                    color: const Color(0xffFF9A8B),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(item.price,
                      style: const TextStyle(color: Colors.white)),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(item.title,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 16)),
                Text(item.location,
                    style: const TextStyle(color: Colors.grey)),
                const SizedBox(height: 10),
                OutlinedButton(
                  onPressed: () {},
                  child: const Text("View details >"),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget bottomNav() {
    return BottomNavigationBar(
      selectedItemColor: Colors.pink,
      unselectedItemColor: Colors.grey,
      items:  [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
        BottomNavigationBarItem(icon: InkWell(child: Icon(Icons.favorite),
            onTap: (){Navigator.pushNamed(context, '/favorites');}), label: "Favorite"),
        BottomNavigationBarItem(icon: Icon(Icons.book), label: "Booking"),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
      ],
    );
  }
}
