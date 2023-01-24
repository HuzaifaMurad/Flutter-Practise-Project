// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:food_delivery/config/config.dart';

import '../../widget/single_item.dart';

class ReviewCartPage extends StatelessWidget {
  const ReviewCartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: ListTile(
        title: const Text(
          'Total Amount',
        ),
        subtitle: Text(
          '\$ 170.00',
          style: TextStyle(
            color: Colors.green[900],
          ),
        ),
        trailing: Container(
          width: 160,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.amber,
            ),
            onPressed: () {},
            child: Text(
              'Submit',
              style: TextStyle(
                color: textColor,
              ),
            ),
          ),
        ),
      ),
      backgroundColor: backgroundScaffoldColor,
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text(
          'Review Cart',
          style: TextStyle(
            color: textColor,
            fontSize: 18,
          ),
        ),
      ),
      body: ListView(
        children: [
          const SizedBox(
            height: 10,
          ),
          SingleItem(
            isBool: true,
          ),
          SingleItem(
            isBool: true,
          ),
          SingleItem(
            isBool: true,
          ),
          SingleItem(
            isBool: true,
          ),
          const SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }
}
