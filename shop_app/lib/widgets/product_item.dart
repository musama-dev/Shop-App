import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../screens/product_detail_screen.dart';
import '../providers/product.dart';
import '../providers/cart.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key});

  // final String id;
  // final String title;
  // final String imageUrl;

  // ProductItem(this.id, this.title, this.imageUrl);
  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context,
        listen: false); // by default listen is true.
    final cart = Provider.of<Cart>(context, listen: false); // not interested
    // in cart changes so that's why listen = false.
    // print("Product rebuilds!");
    return ClipRRect(
      borderRadius: BorderRadius.circular(10.0),
      child: GridTile(
        footer: GridTileBar(
          leading: Consumer<Product>(
            // You can use alternative of consumer approach by splitting the
            // widget tree.
            builder: (ctx, product, child) => IconButton(
              // You can also place underscore on the place of child argument.
              icon: Icon(
                  product.isFavorite ? Icons.favorite : Icons.favorite_border),
              // lable: child, This child refer to the child we define below and
              // it never rebuilds.
              color: Theme.of(context).colorScheme.secondary,
              onPressed: () {
                product.toggleFavoriteStatus();
              },
            ),
            child: const Text("Never changes!"),
          ),
          backgroundColor: Colors.black87,
          title: Text(
            product.title,
            textAlign: TextAlign.center,
          ),
          trailing: IconButton(
            icon: const Icon(Icons.shopping_cart),
            color: Theme.of(context).colorScheme.secondary,
            onPressed: () {
              cart.addItem(product.id, product.price, product.title);
            },
          ),
        ),
        child: GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed(
                ProductDetailScreen.routeName,
                arguments: product.id,
              );
            },
            child: Image.network(
              product.imageUrl,
              fit: BoxFit.cover,
            )),
      ),
    );
  }
}
