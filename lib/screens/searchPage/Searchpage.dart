// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:food_delivery/config/config.dart';
import 'package:food_delivery/modal/ProductModal.dart';
import 'package:food_delivery/widget/single_item.dart';

class SearchPage extends StatefulWidget {
  final List<ProductModel>? search;
  SearchPage({super.key, this.search});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String query = '';

  List<ProductModel>? searchItem(String query) {
    var searchFood = widget.search?.where((element) {
      return element.productName!.toLowerCase().contains(query);
    }).toList();
    return searchFood;
  }

  @override
  Widget build(BuildContext context) {
    var _searchItem = searchItem(query);
    return Scaffold(
      backgroundColor: backgroundScaffoldColor,
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text('Search'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: Icon(Icons.menu_rounded),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            height: 52,
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: TextField(
              onChanged: (value) {
                print(value);

                setState(() {
                  query = value;
                });
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none),
                fillColor: Color(0xffc2c2c2),
                filled: true,
                hintText: 'search for item in the store',
                suffixIcon: Icon(Icons.search),
              ),
            ),
          ),
          ListTile(
            title: Text('Items'),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _searchItem?.length ?? 0,
              itemBuilder: (context, index) {
                return SingleItem(
                  isBool: false,
                  productImage: _searchItem?[index].productImage!,
                  productName: _searchItem?[index].productName!,
                  productPrice: _searchItem?[index].productPrice!,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
