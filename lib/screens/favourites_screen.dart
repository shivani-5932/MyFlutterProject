import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class FavouritesScreen extends StatelessWidget {
  const FavouritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Favourites"),
        leading: const BackButton(),
      ),
      body: Container(
        margin: const EdgeInsets.all(16),
        padding: const EdgeInsets.all(13),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.greyLight),
          boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 4)],
        ),
        child: ListTile(
          title: const Text("Arora's House"),
          subtitle: const Text("Rs 5,500/month"),
          trailing: const Icon(Icons.favorite, color: Colors.red),
        ),
      ),
    );
  }
}
