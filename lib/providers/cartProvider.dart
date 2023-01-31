import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:food_delivery/modal/reviewCart.dart';

class ReviewCartProvider with ChangeNotifier {
  Future<void> addReviewCartData({
    String? cartId,
    String? cartName,
    String? cartImage,
    int? cartPrice,
    int? cartQuantity,
    bool? isAdd,
    var cartUnit,
  }) async {
    FirebaseFirestore.instance
        .collection('ReviewCart')
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .collection('YourReviewCart')
        .doc(cartId)
        .set({
      'cartId': cartId,
      'cartName': cartName,
      'cartImage': cartImage,
      'cartPrice': cartPrice,
      'cartQuantity': cartQuantity,
      'cartUnit': cartUnit,
      'isAdd': true,
    });
  }

  List<ReviewCartModal> reviewCartDataList = [];
  void getReviewCartData() async {
    List<ReviewCartModal> newList = [];
    var reviewCartValue = await FirebaseFirestore.instance
        .collection('ReviewCart')
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .collection('YourReviewCart')
        .get();
    reviewCartValue.docs.forEach((element) {
      var reviewCartModal = ReviewCartModal(
        cartId: element.get('cartId'),
        cartImage: element.get('cartImage'),
        cartName: element.get('cartName'),
        cartPrice: element.get('cartPrice'),
        cartQuantity: element.get('cartQuantity'),
        cartUnit: element.get('cartUnit'),
      );
      newList.add(reviewCartModal);
    });
    reviewCartDataList = newList;
    notifyListeners();
  }

  List<ReviewCartModal> get getReviewCartDataList {
    return reviewCartDataList;
  }

////////Total Price////////////
  double getTotalPrice() {
    double total = 0.0;
    for (var element in reviewCartDataList) {
      total += element.cartPrice! * element.cartQuantity!;
    }
    return total;
  }

  Future<void> updateReviewCartData({
    String? cartId,
    String? cartName,
    String? cartImage,
    int? cartPrice,
    int? cartQuantity,
    bool? isAdd,
    var cartUnit,
  }) async {
    FirebaseFirestore.instance
        .collection('ReviewCart')
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .collection('YourReviewCart')
        .doc(cartId)
        .update({
      'cartId': cartId,
      'cartName': cartName,
      'cartImage': cartImage,
      'cartPrice': cartPrice,
      'cartQuantity': cartQuantity,
      'isAdd': true,
    });
  }

  reviewCartdeleteData(String cartId) {
    FirebaseFirestore.instance
        .collection('ReviewCart')
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .collection('YourReviewCart')
        .doc(cartId)
        .delete();
    notifyListeners();
  }
}
