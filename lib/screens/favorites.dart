import 'package:ecommerce_project/screens/provider/fav_provider.dart';
import 'package:ecommerce_project/screens/widgets/custom_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Fav_screen extends StatelessWidget {
  const Fav_screen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Consumer<FavProvider>(
      builder: (context, favProvider, child) {
        return CustomScaffold(
          body: ListView.builder(
            itemCount: favProvider.favorites.length,
            itemBuilder: (context, index) {
              final product = favProvider.favorites[index];
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(.4),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: ListTile(
                      leading: Image.asset(product.image, fit: BoxFit.cover),
                      title: Text(product.name),
                      subtitle: Text('\$${product.price}'),
                      trailing: IconButton(
                        onPressed: () {
                          // Remove the product from favorites when tapped
                          favProvider.removeFav(product);
                        },
                        icon: Icon(
                          Icons.favorite,
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
