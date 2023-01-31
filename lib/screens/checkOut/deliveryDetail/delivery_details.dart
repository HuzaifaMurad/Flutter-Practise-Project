// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:food_delivery/config/config.dart';
import 'package:food_delivery/providers/check_out_provider.dart';
import 'package:food_delivery/screens/checkOut/addDeliveryAddress/addDeliverAdd.dart';
import 'package:food_delivery/screens/checkOut/deliveryDetail/single_delivery_item.dart';
import 'package:provider/provider.dart';

import '../../payment_summary/payment_summary.dart';

class DeliveryDetails extends StatelessWidget {
  DeliveryDetails({super.key});
  bool isAddress = false;

  @override
  Widget build(BuildContext context) {
    CheckOutProvider deliveryAddressProvider = Provider.of(context);
    deliveryAddressProvider.getDeliveryAddressData();
    var data = deliveryAddressProvider.getDeliveryListData;
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
          'delivery Details',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: primaryColor,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => AddDeliveryAddress(),
            ),
          );
        },
        backgroundColor: primaryColor,
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: Container(
        width: 160,
        height: 48,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
        ),
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: ElevatedButton(
            onPressed: () {
              data.isEmpty
                  ? Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => AddDeliveryAddress(),
                      ),
                    )
                  : Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => PaumentSummary(),
                      ),
                    );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: primaryColor,
            ),
            child: data.isEmpty
                ? Text(
                    'Add new Address',
                    style: TextStyle(color: Colors.black),
                  )
                : Text(
                    'Payment Summary',
                    style: TextStyle(color: Colors.black),
                  ),
          ),
        ),
      ),
      body: Column(
        children: [
          ListTile(
            title: Text('Deliver To'),
            leading: Image.asset(
              'assets/location.png',
              height: 30,
            ),
          ),
          Divider(
            height: 1,
            thickness: 1,
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: data.isEmpty ? 1 : data.length,
              itemBuilder: (context, index) {
                return data.isEmpty
                    ? Container(
                        child: Text(
                          'No Data',
                          textAlign: TextAlign.center,
                        ),
                      )
                    : SingleDeliveryItem(
                        address:
                            'area,${data[index].area} , street ${data[index].street},soceity ${data[index].society}, city, ${data[index].city}',
                        title:
                            '${data[index].firstName} ${data[index].lastName}',
                        addressType:
                            data[index].addressType == 'AddressType.other'
                                ? 'other'
                                : data[index].addressType == 'AddressType.home'
                                    ? 'Home'
                                    : 'Work',
                        number: '${data[index].mobileNo}',
                      );
              },
            ),
          ),
        ],
      ),
    );
  }
}
