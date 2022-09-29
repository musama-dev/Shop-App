import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart.dart' show Cart; // This will only import cart class.
// import '../widgets/cart_item.dart' as ci; // ci used as a prefix.
import '../widgets/cart_item.dart';

class CartScreen extends StatelessWidget {
  static const routeName = "/cart";
  @override
  Widget build(BuildContext context) {
    final cart =
        Provider.of<Cart>(context); // Here we dont do listen: false because
    // we want to listen changes.
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Cart"),
      ),
      body: Column(
        children: [
          Card(
            margin: EdgeInsets.all(15.0),
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Total",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  // SizedBox(
                  //   width: 10,
                  // ),
                  Spacer(), // this take all the available space and reserve
                  // for itself.
                  Chip(
                    label: Text(
                      "\$ ${cart.totalAmount}",
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
                    onPressed: () {},
                    child: Text("ORDER NOW"),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            // expanded takes as much space left in the column.
            child: ListView.builder(
              itemCount: cart.items.length,
              itemBuilder: (ctx, i) {
                return CartItem(
                  // Here we are interested only in the values of the map so
                  // that's why .values used.
                  cart.items.values.toList()[i].id,
                cart.items.values.toList()[i].price,
                cart.items.values.toList()[i].quantity,
                cart.items.values.toList()[i].title,
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
