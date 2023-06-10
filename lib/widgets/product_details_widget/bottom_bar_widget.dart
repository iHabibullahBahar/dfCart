import 'dart:ui';

import 'package:dfcart/config/config.dart';
import 'package:dfcart/utils/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomBar extends StatelessWidget {
  final int productID;
  final VoidCallback onBuyNowPressed;
  final VoidCallback onAddToCartPressed;

  BottomBar({
    required this.productID,
    required this.onBuyNowPressed,
    required this.onAddToCartPressed,
  });

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return BottomAppBar(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(width * 0.02, 8, width * 0.01, 8),
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, CheckoutScreenRoute);
              },
              child: Text('Buy Now', style: TextStyle(fontSize: 12)),
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(secondaryColor1),
                  minimumSize: MaterialStateProperty.all<Size>(
                    Size(MediaQuery.of(context).size.width * 0.47, 45),
                  )),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(width * 0.01, 8, width * 0.02, 8),
            child: ElevatedButton(
              onPressed: () {},
              child: Text(
                'Add to Cart',
                style: TextStyle(fontSize: 12),
              ),
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(primaryColor),
                  minimumSize: MaterialStateProperty.all<Size>(
                    //Size(120, 45),
                    Size(MediaQuery.of(context).size.width * 0.47, 45),
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
