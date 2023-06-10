import 'package:flutter/material.dart';

import 'screens/splash_screen/splash_screen.dart';
import 'screens/product_details_screen/product_details_screen.dart';
import 'screens/checkout_screen/checkout_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'dfCart',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        "/": (context) => const SplashScreen(),
        //"/": (context) => ProductDetailsScreen(),
        //"/": (context) => CheckoutScreen(),
        "/productDetails": (context) => ProductDetailsScreen(),
        "/checkout": (context) => CheckoutScreen(),
      },
    );
  }
}
