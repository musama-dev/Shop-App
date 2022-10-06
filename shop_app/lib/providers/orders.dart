import 'package:flutter/material.dart';
import './cart.dart';

class OrderItem {
  final String id;
  final double amount; // total amount = quantity x price.
  final List<CartItem> products; // find which quantity was ordered through cart.
  final DateTime dateTime; // time at which the order was placed.

  OrderItem(
      {required this.id,
      required this.amount,
      required this.products,
      required this.dateTime});
}

class Orders with ChangeNotifier {
  final List<OrderItem> _orders = [];

  List<OrderItem> get orders {
    return [..._orders];
  }

  void addOrder(List<CartItem> cartProducts, double total) {
    _orders.insert(
      0,
      OrderItem(
        id: DateTime.now().toString(),
        amount: total,
        dateTime: DateTime.now(),
        products: cartProducts,
      ),
    );
    // you can also use _orders.add()
    notifyListeners(); // any places in the app which are listening to this order
    // or depends on it gets rebuild by calling notifyListeners().
  }
}
