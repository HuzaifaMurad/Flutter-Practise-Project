// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class ProductUnit extends StatelessWidget {
  final Function()? onTap;
  final String? title;
  const ProductUnit({
    super.key,
    this.onTap,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 8.0),
      height: 25,
      width: 120,
      child: OutlinedButton(
        onPressed: onTap,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              Text(
                title ?? '30 G',
                style: TextStyle(fontSize: 10, color: Colors.black),
              ),
              Icon(
                Icons.arrow_drop_down,
                color: Colors.black,
              )
            ],
          ),
        ),
      ),
    );
  }
}
