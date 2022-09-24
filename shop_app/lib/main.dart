import 'package:flutter/material.dart';
import './screens/products_overview_screen.dart';
import 'screens/product_detail_screen.dart';
import './providers/products.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      // you provide data in the form of objects in provider approach.
      
      // .) ChangeNotifierProvider cleans up your previous data automatically.
      // .) When you create new instance of object and you want to provide
      // this, use the create approch.

      // .) But if you want to use existing object in a provider that's
      // inside a grid or list so use provider with .value().
      // create: (ctx) => Products(), // it returns a new instance of a provided class.
      // In version 3.0.0 of the provider package its builder instead of create.

      create: (ctx) => Products(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "MyShop",
        theme: ThemeData(
          fontFamily: "Lato", colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.purple).copyWith(secondary: Colors.deepOrange),
        ),
        home: ProductsOverviewScreen(),
        routes: {
          ProductDetailScreen.routeName :(ctx) => ProductDetailScreen(),
        },
      ),
    );
  }
}
