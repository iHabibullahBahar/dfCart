import 'package:dfcart/config/config.dart';
import 'package:flutter/material.dart';

class IconButtonWidget extends StatelessWidget {
  final String image;
  final String label;
  const IconButtonWidget({required this.image, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(
          backgroundColor: backgroundColor,
          radius: 20,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              image,
            ),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}
