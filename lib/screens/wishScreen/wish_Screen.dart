// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:food_delivery/config/config.dart';
import 'package:food_delivery/providers/cartProvider.dart';
import 'package:food_delivery/providers/wishlistProvider.dart';
import 'package:provider/provider.dart';

import '../../widget/single_item.dart';

class WishList extends StatefulWidget {
  const WishList({super.key});

  @override
  State<WishList> createState() => _WishListState();
}

class _WishListState extends State<WishList> {
  WishListProvider? wishListProvider;
  @override
  Widget build(BuildContext context) {
    wishListProvider = Provider.of(context);
    wishListProvider!.getWishListData();

    return Scaffold(
      backgroundColor: backgroundScaffoldColor,
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text(
          'Wish List',
          style: TextStyle(
            color: textColor,
            fontSize: 18,
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: wishListProvider!.getWishLists.length,
        itemBuilder: (context, index) {
          var data = wishListProvider!.getWishLists[index];
          return Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              SingleItem(
                isBool: true,
                productImage: data.productImage,
                productName: data.productName,
                productPrice: data.productPrice,
                productId: data.productId,
                productQuantity: data.quantity,
                onDelete: () {
                  showDialog(
                    context: context,
                    builder: (ctx) => AlertDialog(
                      title: const Text("WishList product"),
                      content: const Text("do you want to wishList delete?"),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () {
                            wishListProvider!.deleteWishList(data.productId);
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
