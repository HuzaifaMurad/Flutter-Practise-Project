import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:food_delivery/modal/ProductModal.dart';

class ProductProvider with ChangeNotifier {
  ProductModel? productModel;
  List<ProductModel> search = [];
  productModels(QueryDocumentSnapshot element) {
    productModel = ProductModel(
      productImage: element.get('productImage'),
      productName: element.get('productName'),
      productPrice: element.get('productPrice'),
    );
    search.add(productModel!);
  }

  //////////////////// herbsProductList
  List<ProductModel> herbsProductList = [];

  fetechHerbsProductData() async {
    List<ProductModel> newList = [];
    var value =
        await FirebaseFirestore.instance.collection('HerbsProduct').get();
    value.docs.forEach((element) {
      productModels(element);
      newList.add(productModel!);
    });
    herbsProductList = newList;
    notifyListeners();
  }

  List<ProductModel> get getHerbsProductList {
    return herbsProductList;
  }
  //////////////////FreshProduct

  List<ProductModel> freshProductList = [];

  fetechFreshProductData() async {
    List<ProductModel> newList = [];
    var value =
        await FirebaseFirestore.instance.collection('FreshFruits').get();
    value.docs.forEach((element) {
      productModels(element);
      newList.add(productModel!);
    });
    freshProductList = newList;
    notifyListeners();
  }

  List<ProductModel> get getfreshProductList {
    return freshProductList;
  }

  List<ProductModel> get getSearchitem {
    return search;
  }
}
