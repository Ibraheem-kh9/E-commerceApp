import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/core/services/auth_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MyOrdersViewModel with ChangeNotifier {
  final AuthService _authService = AuthService();
 // User? _user;

  List<String> txtOrder = [
    'Date',
    'Delivery Status',
    'No of items',
    'Total Amount',
  ];
  Stream<QuerySnapshot> fetOrderData()  {
    User? _user = _authService.firebaseAuth.currentUser;
    var result = _authService.firestore
        .collection('OrderDetails')
        .doc(_user!.email)
        .collection('orders').orderBy('date',descending: true)
        .snapshots();

    return result;
  }


}
