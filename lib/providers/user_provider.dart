import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:food_delivery/modal/userModal.dart';

class UserProvider with ChangeNotifier {
  Future<void> addUserData({
    User? currentUser,
    String? userName,
    String? userEmail,
    String? userImage,
  }) async {
    await FirebaseFirestore.instance
        .collection('usersData')
        .doc(currentUser!.uid)
        .set(
      {
        'userName': userName,
        'userEmail': userEmail,
        'userImage': userImage,
        'userUid': currentUser.uid,
      },
    );
  }

  UserModel? currentData;
  Future<void> getUserData() async {
    UserModel? userModel;
    var value = await FirebaseFirestore.instance
        .collection('usersData')
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .get();
    if (value.exists) {
      userModel = UserModel(
        userEmail: value.get('userEmail'),
        userImage: value.get('userImage'),
        userName: value.get('userName'),
        userUid: value.get('userUid'),
      );
    }
    currentData = userModel;
    notifyListeners();
  }

  UserModel? get currentUserData {
    return currentData;
  }
}
