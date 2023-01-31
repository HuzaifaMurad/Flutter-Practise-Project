// ignore_for_file: sort_child_properties_last, prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:food_delivery/config/config.dart';
import 'package:food_delivery/providers/cartProvider.dart';
import 'package:food_delivery/screens/payment_summary/myGoogle_pay.dart';
import 'package:food_delivery/screens/payment_summary/order_item.dart';
import 'package:provider/provider.dart';

import '../../providers/check_out_provider.dart';
import '../checkOut/deliveryDetail/single_delivery_item.dart';

class PaumentSummary extends StatefulWidget {
  const PaumentSummary({
    super.key,
  });

  @override
  State<PaumentSummary> createState() => _PaumentSummaryState();
}

enum AddressType {
  home,
  onlinePayment,
}

class _PaumentSummaryState extends State<PaumentSummary> {
  var myTYpe = AddressType.home;

  @override
  Widget build(BuildContext context) {
    CheckOutProvider deliveryAddressProvider = Provider.of(context);
    deliveryAddressProvider.getDeliveryAddressData();
    var data = deliveryAddressProvider.getDeliveryListData;
    ReviewCartProvider reviewCartProvider = Provider.of(context);
    reviewCartProvider.getReviewCartData();

    double totalPrice = reviewCartProvider.getTotalPrice();
    double discount = 30;
    double shippingCharges = 5;
    double total = 0;
    if (totalPrice > 300) {
      double discountValue = (totalPrice * discount) / 100;
      total = totalPrice - discountValue;
    }
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
          'Payment Summary',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: primaryColor,
      ),
      bottomNavigationBar: ListTile(
        title: const Text('Total Amount'),
        subtitle: Text(
          '\$${total == 0 ? totalPrice + 5 : total + 5}',
          style: TextStyle(
            color: Colors.green[900],
            fontWeight: FontWeight.bold,
            fontSize: 17,
          ),
        ),
        trailing: Container(
          width: 160,
          child: ElevatedButton(
            onPressed: () {
              myTYpe == AddressType.onlinePayment
                  ? Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => MyGooglePay(
                          total: total == 0 ? totalPrice + 5 : total + 5),
                    ))
                  : Container();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: primaryColor,
            ),
            child: const Text('Place Order'),
          ),
        ),
      ),
      body: Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: ListView.builder(
            itemCount: 1,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  SingleDeliveryItem(
                    address:
                        'area,${data[index].area} , street ${data[index].street},soceity ${data[index].society}, city, ${data[index].city}',
                    title: '${data[index].firstName} ${data[index].lastName}',
                    addressType: data[index].addressType == 'AddressType.other'
                        ? 'other'
                        : data[index].addressType == 'AddressType.home'
                            ? 'Home'
                            : 'Work',
                    number: '${data[index].mobileNo}',
                  ),
                  ListTile(
                    title: Text('First & Last Name'),
                    subtitle: Text(
                      'area,Kpk pakistan mardan home house',
                    ),
                  ),
                  Divider(
                    thickness: 1,
                  ),
                  ExpansionTile(
                    children: reviewCartProvider.getReviewCartDataList.map((e) {
                      return OrderItem(
                        e: e,
                      );
                    }).toList(),
                    title: Text(
                      'Order Item ${reviewCartProvider.getReviewCartDataList.length}',
                    ),
                  ),
                  Divider(
                    thickness: 1,
                  ),
                  ListTile(
                    minVerticalPadding: 5,
                    leading: Text(
                      'Sub Total',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    trailing: Text(
                      '\$${totalPrice + 5}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  ListTile(
                    minVerticalPadding: 5,
                    leading: Text(
                      'Shipping Charges',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    trailing: Text(
                      '\$$shippingCharges',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  ListTile(
                    minVerticalPadding: 5,
                    leading: Text(
                      'Compen Discount',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    trailing: Text(
                      '${total == 0 ? 0 : discount} %',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Divider(
                    thickness: 1,
                  ),
                  ListTile(
                    leading: Text(
                      'Payment Options',
                    ),
                  ),
                  RadioListTile(
                    value: AddressType.home,
                    groupValue: myTYpe,
                    title: Text('other'),
                    secondary: Icon(
                      Icons.other_houses,
                      color: primaryColor,
                    ),
                    onChanged: (value) {
                      setState(
                        () {
                          myTYpe = value!;
                        },
                      );
                    },
                  ),
                  RadioListTile(
                    value: AddressType.onlinePayment,
                    groupValue: myTYpe,
                    title: Text('Online Payment'),
                    secondary: Icon(
                      Icons.payment,
                      color: primaryColor,
                    ),
                    onChanged: (value) {
                      setState(
                        () {
                          myTYpe = value!;
                        },
                      );
                    },
                  )
                ],
              );
            },
          )),
    );
  }
}
