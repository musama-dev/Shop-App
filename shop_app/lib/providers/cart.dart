import 'package:flutter/material.dart';

class CartItem {
  final String id;
  final String title;
  final int quantity; // quantity of the items that the user buy.
  final double price; // price per product. we calculate the total price by multiplying
  // with quantity.

  CartItem(
      {required this.id,
      required this.title,
      required this.quantity, 
      required this.price});
}

class Cart extends ChangeNotifier {
  late Map<String, CartItem> _items;

  Map<String, CartItem> get items {
    return {..._items};
  }

  void addItem(String productId, double price, String title) {
    // here we assume that quantity is always be 1.
    if (_items.containsKey(productId)) {
      // change quantity...
      // existing value automatically founds for that key.
      _items.update(productId, (existingCartItem) => CartItem(
        id: existingCartItem.id,
        title: existingCartItem.title,
        price: existingCartItem.price,
        quantity: existingCartItem.quantity + 1,
      ));
    } else {
      _items.putIfAbsent(
          productId,
          () => CartItem(
                id: DateTime.now().toString(),
                title: title,
                price: price,
                quantity: 1,
              ));
    }
  }
}
