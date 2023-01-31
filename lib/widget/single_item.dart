// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:food_delivery/config/config.dart';
import 'package:food_delivery/widget/count.dart';
import 'package:food_delivery/widget/productUnit.dart';

class SingleItem extends StatelessWidget {
  bool? isBool = false;
  final String? productImage;
  final String? productName;
  final int? productPrice;
  final String? productId;
  final int? productQuantity;
  bool? wishList = false;
  final Function()? onDelete;
  var productUnit;
  SingleItem(
      {super.key,
      this.wishList,
      this.isBool,
      this.productUnit,
      this.productImage = '',
      this.productName = '',
      this.productPrice = 0,
      this.productId = '',
      this.productQuantity,
      this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 100,
              child: Center(
                child: Image.network(productImage ?? ''),
              ),
            ),
          ),
          Expanded(
            child: Container(
              height: 100,
              child: Column(
                mainAxisAlignment: isBool == false
                    ? MainAxisAlignment.spaceAround
                    : MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      Text(
                        productName ?? 'Text',
                        style: TextStyle(
                          color: textColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        ' \$ $productPrice',
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                      isBool == false
                          ? InkWell(
                              onTap: () {
                                showModalBottomSheet(
                                    context: context,
                                    builder: (BuildContext bc) {
                                      return Container(
                                        child: Wrap(
                                          children: <Widget>[
                                            ListTile(
                                                title: Text('1kg'),
                                                onTap: () => {}),
                                            ListTile(
                                              title: Text('2kg'),
                                              onTap: () => {},
                                            ),
                                            ListTile(
                                              title: Text('3kg'),
                                              onTap: () => {},
                                            ),
                                          ],
                                        ),
                                      );
                                    });
                              },
                              child: Container(
                                margin: const EdgeInsets.only(right: 15),
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                height: 35,
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.green),
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        '50 Gram',
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                    Center(
                                      child: Icon(
                                        Icons.arrow_drop_down,
                                        size: 20,
                                        color: primaryColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          : Text(productUnit),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              height: 100,
              padding: isBool == false
                  ? EdgeInsets.symmetric(horizontal: 15, vertical: 32)
                  : EdgeInsets.only(left: 15, right: 15),
              child: isBool == false
                  ? Container(
                      height: 25,
                      width: 50,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.green),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.add,
                              color: primaryColor,
                              size: 20,
                            ),
                            Text(
                              'ADD',
                              style: TextStyle(
                                color: primaryColor,
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Column(
                        children: [
                          IconButton(
                            onPressed: onDelete,
                            icon: Icon(
                              Icons.delete,
                              size: 30,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          wishList == false
                              ? Counter(
                                  productId: productId,
                                  productImage: productImage,
                                  productName: productName,
                                  productPrice: productPrice,
                                )
                              : Container(),
                        ],
                      ),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
