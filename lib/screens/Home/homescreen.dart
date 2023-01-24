// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:food_delivery/providers/Product_provider.dart';
import 'package:food_delivery/screens/Home/widgets/customDrawer.dart';
import 'package:food_delivery/screens/Home/widgets/homeitems.dart';
import 'package:food_delivery/screens/productOver/product_overview.dart';
import 'package:food_delivery/screens/searchPage/Searchpage.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ProductProvider? productProvider;
  @override
  void initState() {
    // TODO: implement initState
    ProductProvider productProvider = Provider.of(context, listen: false);
    productProvider.fetechHerbsProductData();
    productProvider.fetechFreshProductData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    productProvider = Provider.of(context);
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.grey[300],
      drawer: CustomDrawer(),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
          'HOME PAGE',
          style: TextStyle(color: Colors.black, fontSize: 17),
        ),
        actions: [
          CircleAvatar(
              radius: 15,
              backgroundColor: Color(0xffd4d181),
              child: IconButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) =>
                          SearchPage(search: productProvider?.getSearchitem),
                    ),
                  );
                },
                icon: Icon(
                  Icons.search,
                  size: 17,
                  color: Colors.black,
                ),
              )),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: CircleAvatar(
              radius: 15,
              backgroundColor: Color(0xffd4d181),
              child: Icon(
                Icons.shop,
                size: 17,
                color: Colors.black,
              ),
            ),
          ),
        ],
        backgroundColor: const Color(0xffd6b738),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    height: 170,
                    decoration: BoxDecoration(
                      image: const DecorationImage(
                          image: AssetImage(
                            'assets/wallpaper3.jpg',
                          ),
                          fit: BoxFit.cover),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    height: 170,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: const LinearGradient(
                        colors: [
                          Colors.black87,
                          Colors.black45,
                          Colors.transparent,
                        ],
                        stops: [0.13, 0.4, 1],
                        begin: Alignment.topLeft,
                        end: Alignment.center,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    height: 35,
                    width: 70,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(40),
                            bottomRight: Radius.circular(40)),
                        color: Color(0xffd1ad17)),
                    child: const Padding(
                      padding: EdgeInsets.only(left: 10.0, top: 5),
                      child: Text(
                        'FOODIE',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          shadows: [
                            BoxShadow(
                              blurRadius: 3,
                              color: Colors.green,
                              spreadRadius: 10,
                              offset: Offset(2, 2),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: height * 0.06,
                  left: width * 0.07,
                  child: const Text(
                    '30%off',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      shadows: [
                        BoxShadow(
                          blurRadius: 7,
                          color: Colors.green,
                          spreadRadius: 10,
                          offset: Offset(4, 4),
                        )
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: height * 0.06,
                  left: width * 0.07,
                  child: const Text(
                    'on all our products',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    ),
                  ),
                )
              ],
            ),
            ViewText(title: 'Foods', subtitle: 'view all', catgory: 'food'),
            SizedBox(
              height: 270,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: productProvider?.herbsProductList.length,
                itemBuilder: (BuildContext context, int index) {
                  return HomeItems(
                    imagepath:
                        productProvider?.herbsProductList[index].productImage,
                    imagetitile:
                        productProvider?.herbsProductList[index].productName,
                    productPrice:
                        productProvider?.herbsProductList[index].productPrice,
                    ontap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => ProductOverScreen(
                            productName: productProvider
                                ?.herbsProductList[index].productName,
                            productImage: productProvider
                                ?.herbsProductList[index].productImage,
                            productPirce: productProvider
                                ?.herbsProductList[index].productPrice,
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
            ViewText(
                title: 'Fresh Fruit', subtitle: 'view all', catgory: 'fruit'),
            SizedBox(
              height: 270,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: productProvider?.getfreshProductList.length,
                itemBuilder: (BuildContext context, int index) {
                  return HomeItems(
                    imagepath: productProvider
                        ?.getfreshProductList[index].productImage,
                    imagetitile:
                        productProvider?.getfreshProductList[index].productName,
                    productPrice: productProvider
                        ?.getfreshProductList[index].productPrice,
                    ontap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => ProductOverScreen(
                            productImage: productProvider
                                ?.getfreshProductList[index].productImage,
                            productName: productProvider
                                ?.getfreshProductList[index].productName,
                            productPirce: productProvider
                                ?.getfreshProductList[index].productPrice,
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ViewText extends StatelessWidget {
  final String? title;
  final String? subtitle;
  final String? catgory;
  const ViewText({Key? key, this.title, this.subtitle, this.catgory})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProductProvider productProvider = Provider.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title!,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          GestureDetector(
            onTap: () {
              if (catgory == 'food') {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => SearchPage(
                      search: productProvider.getHerbsProductList,
                    ),
                  ),
                );
              } else if (catgory == 'fruit') {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => SearchPage(
                      search: productProvider.getfreshProductList,
                    ),
                  ),
                );
              }
            },
            child: Text(
              subtitle!,
              style: TextStyle(color: Colors.grey),
            ),
          ),
        ],
      ),
    );
  }
}
