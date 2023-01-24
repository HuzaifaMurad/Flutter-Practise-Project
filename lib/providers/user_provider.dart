import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

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
}
