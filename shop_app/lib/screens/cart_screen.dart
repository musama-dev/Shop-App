import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart.dart' show Cart; // This will only import cart class.
// import '../widgets/cart_item.dart' as ci; // ci used as a prefix.
import '../widgets/cart_item.dart';
import '../providers/orders.dart';

class CartScreen extends StatelessWidget {
  static const routeName = "/cart";
  const CartScreen({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final cart =
        Provider.of<Cart>(context); // Here we dont do listen: false because
    // we want to listen changes.
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Cart"),
      ),
      body: Column(
        children: [
          Card(
            margin: const EdgeInsets.all(15.0),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Total",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  // SizedBox(
                  //   width: 10,
                  // ),
                  const Spacer(), // this take all the available space and reserve
                  // for itself.
                  Chip(
                    label: Text(
                      "\$ ${cart.totalAmount.toStringAsFixed(2)}",
                      // here using toStringAsFixed with totalAmount is not necessary because
                      // without adding this the result is also the same.
                      style: TextStyle(
                        color: Theme.of(context)
                            .primaryTextTheme
                            .titleSmall
                            ?.color,
                      ),
                    ),
                    backgroundColor: Colors.purple,
                  ),
                  TextButton(
                    onPressed: () {
                      Provider.of<Orders>(context, listen: false).addOrder(
                          cart.items.values.toList(), cart.totalAmount);
                      cart.clear();
                    },
                    child: const Text("ORDER NOW"),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            // expanded takes as much space left in the column.
            child: ListView.builder(
              itemCount: cart.items.length, // Here if you used items as quantities
              // then in this case cart.items.length used.
              itemBuilder: (ctx, i) {
                return CartItem(
                  // Here we are interested only in the values of the map so
                  // that's why .values used.
                  cart.items.values.toList()[i].id, // returns the list of values
                  // of id.
                  cart.items.keys.toList()[i],
                  cart.items.values.toList()[i].price,
                  cart.items.values.toList()[i].quantity,
                  cart.items.values.toList()[i].title,
                ); // you can also use cart item as a provider.
              },
            ),
          ), // expanded takes as much space as is left
          // in the column.
        ],
      ),
    );
  }
}
