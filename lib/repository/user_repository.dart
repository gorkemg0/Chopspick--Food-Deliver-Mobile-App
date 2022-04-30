import 'dart:async';
import 'package:chopspick/models/my_user.dart';
import 'package:chopspick/models/order_model.dart';
import 'package:chopspick/models/product_model/product_model.dart';
import 'package:chopspick/services/base/auth_base.dart';
import 'package:chopspick/services/firebase_auth_service.dart';
import 'package:chopspick/services/firebase_db.dart';
import 'package:get/get.dart';



class UserRepository implements AuthBase {
  FireStoreDBService _fireStoreDBService = Get.find();
  FirebaseAuthenticationService _firebaseAuthenticationService = Get.find();

  @override
  Future<MyUser?> currentUser() async {
    MyUser? _myUser = await _firebaseAuthenticationService.currentUser();
    try {
      MyUser? yeniUser = await _fireStoreDBService.readUser(_myUser!.userID);
      return yeniUser;
    } catch (e) {
      return null;
    }
  }

  @override
  Future<bool> signOut() async {
    return await _firebaseAuthenticationService.signOut();
  }

  @override
  Future<MyUser?> signInWithGoogle() async {
    MyUser? _myUser = await _firebaseAuthenticationService.signInWithGoogle();

    //kullanıcı aynı mail adresiyle kayıt olup daha sonradan gmail ile giriş yaptığında
    //kullanıcının eski hesabını bu uid'ye atamak için kontrol sağlanıyor
    if (_myUser != null) {
      bool isThereRegistration =
          await _fireStoreDBService.isThereRegistration(email: _myUser.email!);
      if (isThereRegistration == true) {
        return await _fireStoreDBService.readUser(_myUser.userID);
      } else {
        await _fireStoreDBService.saveUser(_myUser);
        return await _fireStoreDBService.readUser(_myUser.userID);
      }
    } else {
      return null;
    }
  }

  @override
  Future<MyUser?> createUserWithEmailAndPassword(
      String email, String sifre) async {
    print("create çalıştı3");
    MyUser? _myUser = await (_firebaseAuthenticationService
        .createUserWithEmailAndPassword(email, sifre));
    return _myUser;
  }

  @override
  Future<MyUser?> signInWithEmailAndPassword(String email, String sifre) async {
    MyUser? _myUser = await (_firebaseAuthenticationService
        .signInWithEmailAndPassword(email, sifre));
    if (_myUser != null) {
      MyUser _user = await _fireStoreDBService.readUser(_myUser.userID);
      return _user;
    }
  }

  Future<MyUser?> readUser(String userID) async {
    return await _fireStoreDBService.readUser(userID);
  }

  @override
  Future<bool> passwordReset(String email) async {
    return await _firebaseAuthenticationService.passwordReset(email);
  }


  Future<void> addProduct({required ProductModel productModel}) async {
    await _fireStoreDBService.addProduct(productModel: productModel);
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
