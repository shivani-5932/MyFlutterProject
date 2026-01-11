import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class PropertyCard extends StatelessWidget {
  final String title;
  final String address;
  final String price;
  final bool liked;

  const PropertyCard({
    super.key,
    required this.title,
    required this.address,
    required this.price,
    required this.liked,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 412,
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                height: 180,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.grey.shade300,
                ),
              ),
              Positioned(
                top: 12,
                right: 12,
                child: Container(
                  width: 36,
                  height: 36,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    liked ? Icons.favorite : Icons.favorite_border,
                    color: Colors.red,
                  ),
                ),
              ),
              Positioned(
                bottom: 12,
                right: 12,
                child: Container(
                  width: 150,
                  height: 48,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: AppColors.peach,
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Colors.white),
                  ),
                  child: Text(
                    price,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
          Text(address, style: const TextStyle(color: Colors.grey)),
          const SizedBox(height: 8),
          OutlinedButton(onPressed: () {}, child: const Text("View details >")),
        ],
      ),
    );
  }
}
