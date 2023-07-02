import 'package:dfcart/models/user_model/user_model.dart';
import 'package:flutter/material.dart';

class ProfileElementWidget extends StatelessWidget {
  String title;
  String value;
  ProfileElementWidget({required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            child: Container(
              child: Text(
                title,
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.grey[200],
            ),
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Text(
              value,
              style: const TextStyle(fontSize: 15),
            ),
          ),
        ],
      ),
    );
  }
}

class AddressLineWidget extends StatelessWidget {
  String text;
  AddressLineWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(fontSize: 15),
    );
  }
}
