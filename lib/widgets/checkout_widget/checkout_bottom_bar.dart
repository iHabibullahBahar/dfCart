import 'dart:ui';

import 'package:dfcart/config/config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CheckoutScreenBottomBar extends StatelessWidget {
  final int productID;
  final VoidCallback onBuyNowPressed;

  CheckoutScreenBottomBar({
    required this.productID,
    required this.onBuyNowPressed,
  });

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return BottomAppBar(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(width * 0.04, 8, width * 0.04, 8),
            child: ElevatedButton(
              onPressed: () {},
              child: Text(
                'Place Order',
                style: TextStyle(fontSize: 12),
              ),
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(primaryColor),
                  minimumSize: MaterialStateProperty.all<Size>(
                    //Size(120, 45),
                    Size(MediaQuery.of(context).size.width * 0.92, 45),
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
