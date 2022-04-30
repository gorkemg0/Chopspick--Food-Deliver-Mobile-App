import 'dart:async';
import 'package:chopspick/models/order_model.dart';
import 'package:chopspick/models/product_model/product_model.dart';
import 'package:chopspick/services/firebase_db.dart';
import 'package:get/get.dart';



class OrderRepository {
  FireStoreDBService _fireStoreDBService = Get.find();


  Future<void> addProduct({required ProductModel productModel}) async {
    //await _fireStoreDBService.addProduct(productModel: productModel);
  }

  Future<List<ProductModel>> getProductsItem({String? category}) async {
    return await _fireStoreDBService.getProductsItem(category: category);
  }
  Future<bool> createOrder({
    required List<ProductModel> products,
    required OrderModel order,
  }) async {
    return await _fireStoreDBService.createOrder(products: products, order: order);
  }
}
