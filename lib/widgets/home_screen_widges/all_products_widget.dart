import 'package:dfcart/models/product_model/product_model.dart';
import 'package:dfcart/widgets/home_screen_widges/product_widget.dart';
import 'package:flutter/material.dart';

class AllProductsWidget extends StatelessWidget {
  final List<ProductModel> loadedAllProducts;
  const AllProductsWidget({required this.loadedAllProducts});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      child: GridView.count(
          crossAxisCount: 2
          // childAspectRatio: 0.7,
          ,
          children: [
            Container(
              color: Colors.red,
              child: Center(
                child: Text("Hello"),
              ),
            )
          ]),
    );
  }
}
