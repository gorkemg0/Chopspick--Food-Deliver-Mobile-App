import 'package:chopspick/models/my_user.dart';
import 'package:chopspick/models/order_model.dart';
import 'package:chopspick/models/product_model/product_model.dart';
import 'package:chopspick/services/base/db_base.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FireStoreDBService implements DBBase {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Future<bool> saveUser(MyUser myUser) async {
    try {
      await _firestore
          .collection("users")
          .doc(myUser.userID)
          .set(myUser.toMap());
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<MyUser> readUser(String? userID) async {
    MyUser? readUserObject;
    DocumentSnapshot _okunanUser =
        await _firestore.collection("users").doc(userID).get();
    Map<String, dynamic> readUserMap =
        _okunanUser.data() as Map<String, dynamic>;
    readUserObject = MyUser.fromMap(readUserMap);
    return readUserObject;
  }

  Future<bool> isThereRegistration({required String email}) async {
    var users = await _firestore
        .collection("users")
        .where("email", isEqualTo: email)
        .get();
    if (users.docs.length >= 1) {
      return true;
    } else {
      return false;
    }
  }

  Future<void> addProduct({required ProductModel productModel}) async {
   // await _firestore.collection("products").add(productModel.toMap());
  }

  Future<List<ProductModel>> getProductsItem({
    String? category,
  }) async {
    List<ProductModel> products = [];
    QuerySnapshot productsDocument;
    if (category == null) {
      productsDocument = await _firestore
          .collection('products')
          .orderBy("createdAtMilliSecond")
          .limit(30)
          .get();
    } else {
      productsDocument = await _firestore
          .collection('products')
          .where("category", isEqualTo: category)
          .orderBy("createdAtMilliSecond")
          .limit(30)
          .get();
    }
    for (DocumentSnapshot snapshot in productsDocument.docs) {
      ProductModel productModel =
          ProductModel.fromMap(snapshot.data() as Map<String, dynamic>);
      products.add(productModel);
    }
    return products;
  }

  Future<bool> createOrder({
    required List<ProductModel> products,
    required OrderModel order,
  }) async {
    try {
      var result = await _firestore.collection("orders").add(order.toMap());
      for (int i = 0; i < products.length; i++) {
        await _firestore
            .collection("orders")
            .doc(result.id)
            .collection("products")
            .add(products[i].toMap());
      }
      return true;
    } catch (e) {
      return false;
    }
  }
}
