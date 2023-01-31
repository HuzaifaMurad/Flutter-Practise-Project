// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:food_delivery/config/config.dart';
import 'package:food_delivery/providers/cartProvider.dart';
import 'package:food_delivery/screens/checkOut/deliveryDetail/delivery_details.dart';
import 'package:provider/provider.dart';

import '../../widget/single_item.dart';

class ReviewCartPage extends StatelessWidget {
  const ReviewCartPage({super.key});

  @override
  Widget build(BuildContext context) {
    ReviewCartProvider reviewCartProvider = Provider.of(context);
    reviewCartProvider.getReviewCartData();
    return Scaffold(
      bottomNavigationBar: ListTile(
        title: const Text(
          'Total Amount',
        ),
        subtitle: Text(
          '\$ ${reviewCartProvider.getTotalPrice()}',
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
            onPressed: () {
              if (reviewCartProvider.getReviewCartDataList.isEmpty) {
                final snak = SnackBar(
                  behavior: SnackBarBehavior.floating,
                  margin: EdgeInsets.only(bottom: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(30),
                    ),
                  ),
                  content: const Text('Hi, I am a SnackBar!'),
                  backgroundColor: (Colors.amber[400]),
                  action: SnackBarAction(
                    label: 'dismiss',
                    onPressed: () {},
                  ),
                );
                ScaffoldMessenger.of(context).showSnackBar(snak);
              } else {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => DeliveryDetails(),
                  ),
                );
              }
            },
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
      body: reviewCartProvider.getReviewCartDataList.isEmpty
          ? Center(
              child: Text('no data'),
            )
          : ListView.builder(
              itemCount: reviewCartProvider.getReviewCartDataList.length,
              itemBuilder: (context, index) {
                var data = reviewCartProvider.getReviewCartDataList[index];
                return Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    SingleItem(
                      isBool: true,
                      wishList: false,
                      productImage: data.cartImage,
                      productName: data.cartName,
                      productPrice: data.cartPrice,
                      productId: data.cartId,
                      productQuantity: data.cartQuantity,
                      productUnit: data.cartUnit,
                      onDelete: () {
                        showDialog(
                          context: context,
                          builder: (ctx) => AlertDialog(
                            title: const Text("cart product"),
                            content: const Text("do you want to delete?"),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () {
                                  reviewCartProvider
                                      .reviewCartdeleteData(data.cartId!);
                                  Navigator.of(ctx).pop();
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.amber,
                                  ),
                                  padding: const EdgeInsets.all(14),
                                  child: const Text("Yes"),
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.of(ctx).pop();
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.amber,
                                  ),
                                  padding: const EdgeInsets.all(14),
                                  child: const Text("No"),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                );
              },
            ),
    );
  }
}
