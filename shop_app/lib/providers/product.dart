import 'package:flutter/material.dart';

class Product with ChangeNotifier {
  final String id;
  final String title;
  final String description;
  final double price;
  final String imageUrl;
  bool isFavorite; // changeable that's why not final.

  Product(
      {required this.id,
      required this.title,
      required this.description,
      required this.price,
      required this.imageUrl,
      this.isFavorite = false});

  void toggleFavoriteStatus() {
    // We just have to invert the value of favourite icon.
    isFavorite = !isFavorite;
    notifyListeners(); // Its like set state. It notify listing widgets so
    // they gets rebuild.
  }
}
