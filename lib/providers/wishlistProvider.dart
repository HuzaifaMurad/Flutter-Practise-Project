import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:food_delivery/modal/ProductModal.dart';

class WishListProvider with ChangeNotifier {
  Future<void> addWishListData({
    String? wishListId,
    String? wishListName,
    String? wishListImage,
    int? wishListPrice,
    int? wishListQuantity,
  }) async {
    FirebaseFirestore.instance
        .collection('WishList')
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .collection('YourWishList')
        .doc(wishListId)
        .set({
      'wishListId': wishListId,
      'wishListName': wishListName,
      'wishListImage': wishListImage,
      'wishListPrice': wishListPrice,
      'wishListQuantity': wishListQuantity,
      'wishList': true,
    });
  }

  List<ProductModel> wishLists = [];
  getWishListData() async {
    List<ProductModel> newList = [];
    var value = await FirebaseFirestore.instance
        .collection('WishList')
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .collection('YourWishList')
        .get();
    value.docs.forEach((element) {
      ProductModel productModel = ProductModel(
        productId: element.get('wishListId'),
        productImage: element.get('wishListImage'),
        productName: element.get('wishListName'),
        productPrice: element.get('wishListPrice'),
        quantity: element.get('wishListQuantity'),
      );
      newList.add(productModel);
    });
    wishLists = newList;
    notifyListeners();
  }

  List<ProductModel> get getWishLists {
    return wishLists;
  }

  deleteWishList(wishlistIds) {
    FirebaseFirestore.instance
        .collection('WishList')
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .collection('YourWishList')
        .doc(wishlistIds)
        .delete();
  }
}
