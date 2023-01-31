import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:food_delivery/modal/delAddModel.dart';
import 'package:location/location.dart';
import 'package:velocity_x/velocity_x.dart';

class CheckOutProvider with ChangeNotifier {
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController mobileNo = TextEditingController();
  TextEditingController phoneNo = TextEditingController();
  TextEditingController society = TextEditingController();
  TextEditingController street = TextEditingController();
  TextEditingController landmark = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController area = TextEditingController();
  TextEditingController pincode = TextEditingController();
  LocationData? setLocation;

  validator(context, myTYpe) async {
    if (firstName.text.isEmpty) {
      VxToast.show(context, msg: 'FirstName is empty');
    } else if (lastName.text.isEmpty) {
      VxToast.show(context, msg: 'lastName is empty');
    } else if (mobileNo.text.isEmpty) {
      VxToast.show(context, msg: 'mobile no is empty');
      ;
    } else if (phoneNo.text.isEmpty) {
      VxToast.show(context, msg: 'phone no is empty');
    } else if (society.text.isEmpty) {
      VxToast.show(context, msg: 'soceity is empty');
    } else if (street.text.isEmpty) {
      VxToast.show(context, msg: 'street is empty');
    } else if (landmark.text.isEmpty) {
      VxToast.show(context, msg: 'landmark is empty');
    } else if (city.text.isEmpty) {
      VxToast.show(context, msg: 'city is empty');
    } else if (area.text.isEmpty) {
      VxToast.show(context, msg: 'area is empty');
    } else if (pincode.text.isEmpty) {
      VxToast.show(context, msg: 'pincode is empty');
    } else if (setLocation == null) {
      VxToast.show(context, msg: 'set location is empty');
    } else {
      await FirebaseFirestore.instance
          .collection('AddDeliveryAddress')
          .doc(FirebaseAuth.instance.currentUser?.uid)
          .set({
        'firstName': firstName.text,
        'lastName': lastName.text,
        'mobileNo': mobileNo.text,
        'phoneNo': firstName.text,
        'society': society.text,
        'street': street.text,
        'landmark': landmark.text,
        'city': city.text,
        'area': area.text,
        'pincode': pincode.text,
        'addressType': myTYpe.toString(),
        'longitude': setLocation?.longitude,
        'latitude': setLocation?.latitude
      }).then((value) async {
        VxToast.show(context, msg: 'added ur delivery address');
        Navigator.of(context).pop();
        notifyListeners();
      });
      notifyListeners();
    }
  }

  List<DeliveryAddressModel> deliveryAddressList = [];
  getDeliveryAddressData() async {
    List<DeliveryAddressModel> newList = [];
    DeliveryAddressModel? deliveryAddressModel;
    var db = await FirebaseFirestore.instance
        .collection('AddDeliveryAddress')
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .get();
    if (db.exists) {
      deliveryAddressModel = DeliveryAddressModel(
        firstName: db.get('firstName'),
        lastName: db.get('lastName'),
        addressType: db.get('addressType'),
        area: db.get('area'),
        phoneNo: db.get('phoneNo'),
        city: db.get('city'),
        landMark: db.get('landmark'),
        mobileNo: db.get('mobileNo'),
        pinCode: db.get('pincode'),
        society: db.get('society'),
        street: db.get('street'),
      );
      newList.add(deliveryAddressModel);
      notifyListeners();
    }
    deliveryAddressList = newList;
    notifyListeners();
  }

  List<DeliveryAddressModel> get getDeliveryListData {
    return deliveryAddressList;
  }
}
