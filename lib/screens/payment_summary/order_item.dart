import 'package:flutter/material.dart';
import 'package:food_delivery/modal/reviewCart.dart';

class OrderItem extends StatelessWidget {
  final ReviewCartModal e;
  const OrderItem({super.key, required this.e});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(
        e.cartImage!,
        width: 60,
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            e.cartName!,
            style: TextStyle(
              color: Colors.grey[600],
            ),
          ),
          Text(
            e.cartUnit,
            style: TextStyle(
              color: Colors.grey[600],
            ),
          ),
          Text(
            '\$${e.cartPrice}',
            style: TextStyle(
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
      subtitle: Text(e.cartQuantity.toString()),
    );
  }
}
