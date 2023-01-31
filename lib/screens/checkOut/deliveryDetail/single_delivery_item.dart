import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:food_delivery/config/config.dart';

class SingleDeliveryItem extends StatelessWidget {
  final String? title;
  final String? address;
  final String? number;
  final String? addressType;
  const SingleDeliveryItem({
    super.key,
    this.title,
    this.address,
    this.addressType,
    this.number,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title ?? 'title'),
              Container(
                width: 60,
                padding: const EdgeInsets.all(1),
                height: 20,
                decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    addressType ?? 'Some Text',
                    style: const TextStyle(fontSize: 13, color: Colors.black),
                  ),
                ),
              )
            ],
          ),
          leading: CircleAvatar(
            radius: 8,
            backgroundColor: primaryColor,
          ),
          subtitle: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(address ?? 'address'),
              const SizedBox(
                height: 5,
              ),
              Text(number ?? 'number')
            ],
          ),
        ),
        const Divider(
          height: 35,
          thickness: 1,
        ),
      ],
    );
  }
}
