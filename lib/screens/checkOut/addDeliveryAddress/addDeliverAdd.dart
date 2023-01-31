// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:food_delivery/providers/check_out_provider.dart';
import 'package:food_delivery/screens/checkOut/deliveryDetail/delivery_details.dart';
import 'package:food_delivery/screens/checkOut/googleMap/google_map.dart';
import 'package:food_delivery/widget/custom_textfield.dart';
import 'package:provider/provider.dart';

import '../../../config/config.dart';

class AddDeliveryAddress extends StatefulWidget {
  const AddDeliveryAddress({super.key});

  @override
  State<AddDeliveryAddress> createState() => _AddDeliveryAddressState();
}

enum AddressType {
  home,
  work,
  other,
}

class _AddDeliveryAddressState extends State<AddDeliveryAddress> {
  var myTYpe = AddressType.home;
  @override
  Widget build(BuildContext context) {
    CheckOutProvider checkOutProvider = Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
          ' add delivery address',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: primaryColor,
      ),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        height: 48,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: ElevatedButton(
            onPressed: () async {
              await checkOutProvider.validator(context, myTYpe);
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => DeliveryDetails(),
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: primaryColor,
            ),
            child: const Text(
              'Add new Address',
              style: TextStyle(color: Colors.black),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            CustomTextField(
              labText: 'First Name',
              controller: checkOutProvider.firstName,
            ),
            CustomTextField(
              labText: 'Last Name',
              controller: checkOutProvider.lastName,
            ),
            CustomTextField(
              labText: 'Mobile No',
              controller: checkOutProvider.mobileNo,
            ),
            CustomTextField(
              labText: 'Phone no',
              controller: checkOutProvider.phoneNo,
            ),
            CustomTextField(
              labText: 'soceity',
              controller: checkOutProvider.society,
            ),
            CustomTextField(
              labText: 'street',
              controller: checkOutProvider.street,
            ),
            CustomTextField(
              labText: 'LandMark',
              controller: checkOutProvider.landmark,
            ),
            CustomTextField(
              labText: 'City',
              controller: checkOutProvider.city,
            ),
            CustomTextField(
              labText: 'Area ',
              controller: checkOutProvider.area,
            ),
            CustomTextField(
              labText: 'pincode',
              controller: checkOutProvider.pincode,
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => CustomGoogleMaps(),
                  ),
                );
              },
              child: Container(
                height: 47,
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    checkOutProvider.setLocation == null
                        ? Text('Set Location')
                        : Text('Done'),
                  ],
                ),
              ),
            ),
            Divider(
              color: Colors.black,
            ),
            ListTile(
              title: Text(
                'address type',
              ),
            ),
            RadioListTile(
              value: AddressType.home,
              groupValue: myTYpe,
              title: Text('home'),
              secondary: Icon(
                Icons.home,
                color: primaryColor,
              ),
              onChanged: (value) {
                setState(() {
                  myTYpe = value!;
                });
              },
            ),
            RadioListTile(
              value: AddressType.work,
              groupValue: myTYpe,
              title: Text('work'),
              secondary: Icon(
                Icons.work,
                color: primaryColor,
              ),
              onChanged: (value) {
                setState(() {
                  myTYpe = value!;
                });
              },
            ),
            RadioListTile(
              value: AddressType.other,
              groupValue: myTYpe,
              title: Text('other'),
              secondary: Icon(
                Icons.other_houses,
                color: primaryColor,
              ),
              onChanged: (value) {
                setState(() {
                  myTYpe = value!;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
