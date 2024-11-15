import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'favorites.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorites'),
      ),
      body: Consumer<Favorites>(
        builder: (context, favorites, child) {
          final favoriteItems = favorites.items;

          if (favoriteItems.isEmpty) {
            return const Center(
              child: Text('No favorites yet.'),
            );
          }

          return ListView.builder(
            itemCount: favoriteItems.length,
            itemBuilder: (context, index) {
              final item = favoriteItems[index];
              return Card(
                child: ListTile(
                  title: Text(item),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      favorites.removeItem(item);
                    },
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
