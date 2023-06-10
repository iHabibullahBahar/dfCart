import 'dart:convert';

import 'package:dfcart/config/config.dart';
import 'package:dfcart/models/category_model/category_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CategoryView extends StatelessWidget {
  final CategoryModel item;

  CategoryView({required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        CircleAvatar(
          radius: 25,
          backgroundColor: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              item.image,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Center(
            child: Text(
              item.categoryName,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 12,
                color: textColors,
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
