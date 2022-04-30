import 'package:cloud_firestore/cloud_firestore.dart';

class OrderModel {
  final String userID;
  final String adress;
  final String name;
  Timestamp? date;
  final int totalPrice;
  String? message;

  OrderModel(
      {required this.userID,
      required this.adress,
      required this.name,
      this.message,
      this.date,
      required this.totalPrice});

  Map<String, dynamic> toMap() {
    return {
      'userID': userID,
      'adress': adress,
      'name': name,
      'message': message,
      'date': date ?? Timestamp.now().millisecondsSinceEpoch,
      'totalPrice': totalPrice,
    };
  }

  OrderModel.fromMap(Map<String, dynamic> map)
      : userID = map['userID'],
        adress = map['adress'],
        name = map['name'],
        message = map['message'],
        date = map['date'],
        totalPrice = map['totalPrice'];
}
