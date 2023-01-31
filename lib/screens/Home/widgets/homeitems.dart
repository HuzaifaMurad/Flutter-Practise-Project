// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:food_delivery/config/config.dart';
import 'package:food_delivery/modal/ProductModal.dart';
import 'package:food_delivery/widget/count.dart';
import 'package:food_delivery/widget/productUnit.dart';

class HomeItems extends StatefulWidget {
  final String? imagepath;
  final String? imagetitile;
  final int? productPrice;
  final Function()? ontap;
  final String? productId;
  final ProductModel? productUnit;

  const HomeItems({
    this.productId,
    this.imagepath,
    this.imagetitile,
    this.ontap,
    this.productPrice,
    this.productUnit,
    Key? key,
  }) : super(key: key);

  @override
  State<HomeItems> createState() => _HomeItemsState();
}

class _HomeItemsState extends State<HomeItems> {
  var unitData;
  var firstValue;
  @override
  Widget build(BuildContext context) {
    widget.productUnit?.productUnit?.firstWhere((element) {
      setState(() {
        firstValue = element;
      });
      return true;
    });
    return SizedBox(
      height: 270,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Container(
          width: 200,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 2,
                child: GestureDetector(
                    onTap: widget.ontap,
                    child: Image.network(widget.imagepath!)),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        widget.imagetitile!,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 17),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        '${widget.productPrice}\$ ${unitData ?? firstValue}',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                            color: Colors.grey),
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: ProductUnit(
                          title: unitData ?? firstValue,
                          onTap: () {
                            showModalBottomSheet(
                                context: context,
                                builder: (BuildContext bc) {
                                  return Container(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: widget.productUnit!.productUnit!
                                          .map<Widget>(
                                        (data) {
                                          return Column(
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(10),
                                                child: InkWell(
                                                  onTap: () async {
                                                    setState(() {
                                                      unitData = data;
                                                    });
                                                    Navigator.of(context).pop();
                                                  },
                                                  child: Text(
                                                    data,
                                                    style: TextStyle(
                                                      color: primaryColor,
                                                      fontSize: 18,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          );
                                        },
                                      ).toList(),
                                      // children: [
                                      //   ListTile(
                                      //       title: Text('1kg'),
                                      //       onTap: () => {
                                      //             Navigator.pop(context),
                                      //           }),
                                      //   ListTile(
                                      //     title: Text('2kg'),
                                      //     onTap: () => {
                                      //       Navigator.pop(context),
                                      //     },
                                      //   ),
                                      //   ListTile(
                                      //     title: Text('3kg'),
                                      //     onTap: () => {
                                      //       Navigator.pop(context),
                                      //     },
                                      //   ),
                                      // ],
                                    ),
                                  );
                                });
                          },
                        )),
                        Expanded(
                          child: Counter(
                            productId: widget.productId,
                            productImage: widget.imagepath,
                            productName: widget.imagetitile,
                            productPrice: widget.productPrice,
                            producUnit: unitData ?? firstValue,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
