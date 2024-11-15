import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'favorites.dart';
import 'favorites_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Favorites(),
      child: MaterialApp(
        title: 'Favorites App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const ProductListScreen(),
      ),
    );
  }
}

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> products = List.generate(20, (index) => 'Product $index');

    return Scaffold(
      appBar: AppBar(
        title: const Text('Product List'),
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return Card(
            child: ListTile(
              title: Text(product),
              trailing: Consumer<Favorites>(
                builder: (context, favorites, child) {
                  final isFavorite = favorites.items.contains(product);
                  return IconButton(
                    icon: Icon(
                      isFavorite ? Icons.favorite : Icons.favorite_border,
                      color: isFavorite ? Colors.red : null,
                    ),
                    onPressed: () {
                      if (isFavorite) {
                        favorites.removeItem(product);
                      } else {
                        favorites.addItem(product);
                      }
                    },
                  );
                },
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const FavoritesScreen(),
            ),
          );
        },
        child: const Icon(Icons.favorite),
      ),
    );
  }
}
