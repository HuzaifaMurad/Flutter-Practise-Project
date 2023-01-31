// ignore_for_file: prefer_const_constructors

import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/config/config.dart';
import 'package:food_delivery/modal/ProductModal.dart';
import 'package:food_delivery/providers/cartProvider.dart';
import 'package:provider/provider.dart';

class Counter extends StatefulWidget {
  final String? productName;
  final String? productImage;
  final String? productId;
  var producUnit;

  final int? productPrice;
  Counter({
    super.key,
    this.productId,
    this.productImage,
    this.productName,
    this.productPrice,
    this.producUnit,
  });

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int count = 1;
  bool istrue = false;
  getAddandQuantity() {
    FirebaseFirestore.instance
        .collection('ReviewCart')
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .collection('YourReviewCart')
        .doc(widget.productId)
        .get()
        .then((value) {
      if (this.mounted) {
        if (value.exists) {
          setState(() {
            count = value.get('cartQuantity');
            istrue = value.get('isAdd');
          });
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    getAddandQuantity();
    ReviewCartProvider reviewCartProvider = Provider.of(context);
    return Container(
      padding: const EdgeInsets.only(left: 8.0, right: 8),
      height: 25,
      width: 120,
      child: OutlinedButton(
        onPressed: () {},
        child: istrue == true
            ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  InkWell(
                    onTap: () {
                      if (count == 1) {
                        setState(() {
                          istrue = false;
                        });
                        reviewCartProvider
                            .reviewCartdeleteData(widget.productId!);
                      } else {
                        setState(() {
                          count--;
                        });
                        reviewCartProvider.updateReviewCartData(
                          cartId: widget.productId,
                          cartImage: widget.productImage,
                          cartName: widget.productName,
                          cartPrice: widget.productPrice,
                          cartQuantity: count,
                        );
                      }
                    },
                    child: Icon(
                      Icons.remove,
                      color: Colors.amber,
                      size: 17,
                    ),
                  ),
                  Text(
                    '$count',
                    style: TextStyle(fontSize: 10, color: Colors.amber),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        count++;
                      });
                      reviewCartProvider.updateReviewCartData(
                        cartId: widget.productId,
                        cartImage: widget.productImage,
                        cartName: widget.productName,
                        cartPrice: widget.productPrice,
                        cartQuantity: count,
                      );
                    },
                    child: Icon(
                      Icons.add,
                      color: Colors.amber,
                      size: 17,
                    ),
                  ),
                ],
              )
            : Center(
                child: InkWell(
                  onTap: () {
                    setState(() {
                      istrue = true;
                    });
                    reviewCartProvider.addReviewCartData(
                        cartId: widget.productId,
                        cartImage: widget.productImage,
                        cartName: widget.productName,
                        cartPrice: widget.productPrice,
                        cartQuantity: count,
                        cartUnit: widget.producUnit);
                  },
                  child: Text(
                    'Add',
                    style: TextStyle(color: primaryColor),
                  ),
                ),
              ),
      ),
    );
  }
}
