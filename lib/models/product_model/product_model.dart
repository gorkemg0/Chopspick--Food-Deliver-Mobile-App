import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hive/hive.dart';

part 'product_model.g.dart';

@HiveType(typeId: 0)
class ProductModel {
  @HiveField(0)
  final String productID;
  @HiveField(1)
  final String productName;
  @HiveField(2)
  final String productAbout;
  @HiveField(3)
  final String? category;
  @HiveField(4)
  String photoUrl;
  @HiveField(5)
  double productStar;
  @HiveField(6)
  int productPrice;
  @HiveField(7)
  int productAmount;
  @HiveField(8)
  int? createdAtMilliSecond;

  ProductModel(
      {required this.productID,
      required this.productName,
      required this.productAbout,
      required this.category,
      required this.photoUrl,
      required this.productStar,
      required this.productAmount,
      required this.productPrice,
      this.createdAtMilliSecond});

  Map<String, dynamic> toMap() {
    return {
      'productID': productID,
      'productName': productName,
      'productAbout': productAbout,
      'category': category,
      'photoUrl': photoUrl,
      'productStar': productStar,
      'productAmount': productAmount,
      'productPrice': productPrice,
      'createdAt':
          createdAtMilliSecond ?? Timestamp.now().millisecondsSinceEpoch,
    };
  }

  ProductModel.fromMap(Map<String, dynamic> map)
      : productID = map['productID'],
        productName = map['productName'],
        productAbout = map['productAbout'],
        category = map['category'],
        photoUrl = map['photoUrl'],
        productStar = map['productStar'],
        productAmount = map['productAmount'],
        productPrice = map['productPrice'],
        createdAtMilliSecond = map['createdAtMilliSecond'];
}
