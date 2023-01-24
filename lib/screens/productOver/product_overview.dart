// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:food_delivery/config/config.dart';

enum SinginChracater { fill, outline }

class ProductOverScreen extends StatefulWidget {
  final String? productName;
  final String? productImage;
  final int? productPirce;
  ProductOverScreen({
    super.key,
    this.productImage,
    this.productName,
    this.productPirce,
  });

  @override
  State<ProductOverScreen> createState() => _ProductOverScreenState();
}

class _ProductOverScreenState extends State<ProductOverScreen> {
  SinginChracater _chracater = SinginChracater.fill;

  Widget ButtomNavigatorBar(
      {Color? iconColor,
      Color? backgroundColor,
      Color? color,
      String? title,
      IconData? iconData}) {
    return Expanded(
      child: Container(
        height: 60,
        padding: const EdgeInsets.all(10),
        color: backgroundColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              iconData,
              size: 17,
              color: iconColor,
            ),
            const SizedBox(
              width: 5,
            ),
            Text(
              title!,
              style: TextStyle(
                color: color,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Row(
        children: [
          ButtomNavigatorBar(
              backgroundColor: textColor,
              color: Colors.white70,
              iconColor: Colors.grey,
              title: 'Add to whistlist',
              iconData: Icons.favorite_outline),
          ButtomNavigatorBar(
              backgroundColor: primaryColor,
              color: textColor,
              iconColor: Colors.white70,
              title: 'go to cart',
              iconData: Icons.shop_outlined),
        ],
      ),
      backgroundColor: backgroundScaffoldColor,
      appBar: AppBar(
        backgroundColor: primaryColor,
        iconTheme: IconThemeData(color: textColor),
        title: Text(
          'Product Overview ',
          style: TextStyle(color: textColor),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              width: double.infinity,
              child: Column(
                children: [
                  ListTile(
                    title: Text(widget.productName!),
                    subtitle: Text('\$${widget.productPirce}'),
                  ),
                  Container(
                    height: 250,
                    padding: const EdgeInsets.all(40),
                    child: Image.network(
                      widget.productImage!,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    width: double.infinity,
                    child: Text(
                      'available options',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: textColor, fontWeight: FontWeight.w600),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 3,
                              backgroundColor: Colors.green[700],
                            ),
                            Radio(
                              activeColor: Colors.green[700],
                              value: SinginChracater.fill,
                              groupValue: _chracater,
                              onChanged: (value) {
                                setState(() {
                                  _chracater = value!;
                                });
                              },
                            )
                          ],
                        ),
                        Text('\$${widget.productPirce}'),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 30, vertical: 10),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.add,
                                size: 17,
                                color: primaryColor,
                              ),
                              Text(
                                'Add',
                                style: TextStyle(color: primaryColor),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
              child: Container(
            padding: const EdgeInsets.all(20),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "about this product",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "First published in 1981 as The Computer Glossary, a 300-term, text-only handbook for Alan Freedman's computer literacy seminars, by 1989, the 3,500-term",
                  style: TextStyle(fontSize: 16, color: textColor),
                ),
              ],
            ),
          ))
        ],
      ),
    );
  }
}
