// Add these new classes after the CartPage class

import 'package:another_pro/main.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FavoritesPage extends StatelessWidget {
  final List<FlowerProduct> favoriteProducts = [
    FlowerProduct(
      id: '1',
      name: 'Rose Bouquet',
      description: 'Classic red rose bouquet, perfect for romantic occasions',
      price: 12.99,
      imageUrl: 'https://img.freepik.com/free-photo/red-roses-bouquet-table_140725-828.jpg?uid=R63094493&semt=ais_hybrid',
      categories: ['Romantic', 'Best Sellers'],
    ),
    FlowerProduct(
      id: '3',
      name: 'Orchid Elegance',
      description: 'Exotic orchid arrangement in a modern ceramic pot',
      price: 13.00,
      imageUrl: 'https://img.freepik.com/free-photo/modern-floral-composition-with-elegant-style_23-2147897563.jpg?uid=R63094493&semt=ais_hybrid',
      categories: ['Luxury', 'Indoor'],
    ),
  ];

   FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Favorites',style:TextStyle(color: Colors.white),),
        backgroundColor: Colors.pink,
      ),
      body: favoriteProducts.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.favorite_border,
                    size: 64,
                    color: Colors.grey,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'No favorites yet',
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: favoriteProducts.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: const EdgeInsets.only(bottom: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(16),
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: CachedNetworkImage(
                        imageUrl: favoriteProducts[index].imageUrl,
                        width: 80,
                        height: 80,
                        fit: BoxFit.cover,
                      ),
                    ),
                    title: Text(
                      favoriteProducts[index].name,
                      style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      '\$${favoriteProducts[index].price.toStringAsFixed(2)}',
                      style: GoogleFonts.poppins(
                        color: Colors.pink,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.favorite, color: Colors.pink),
                      onPressed: () {
                        // Remove from favorites functionality
                      },
                    ),
                  ),
                );
              },
            ),
    );
  }
}
