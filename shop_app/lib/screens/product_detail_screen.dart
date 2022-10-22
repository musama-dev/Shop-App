import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/products.dart';

class ProductDetailScreen extends StatelessWidget {
  // final String title;
  // ProductDetailScreen(this.title);

  static const routeName = "/product-detail";

  const ProductDetailScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context).settings.arguments as String;
    final loadedProducts =
        Provider.of<Products>(context, listen: false).findById(productId);
    // adding a product doesn't effect this screen so that's why listen: false.
    return Scaffold(
      appBar: AppBar(
        title: Text(loadedProducts.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              // we output image in a container.
              height: 300,
              width: double.infinity,
              child: Image.network(loadedProducts.imageUrl, fit: BoxFit.cover),
            ),
            const SizedBox(
              height: 10,
            ),
            Text("\$${loadedProducts.price}", style: const TextStyle(
              color: Colors.grey,
              fontSize: 20,
            ),
            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              width: double.infinity,
              child: Text(loadedProducts.description, textAlign: TextAlign.center,
              softWrap: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
