import 'dart:io';

import 'package:chopspick/global/component/hive_box_names.dart';
import 'package:chopspick/models/product_model/product_model.dart';
import 'package:chopspick/repository/order_repository.dart';
import 'package:chopspick/repository/user_repository.dart';
import 'package:chopspick/screens/basket_page/basket_view_model.dart';
import 'package:chopspick/services/firebase_auth_service.dart';
import 'package:chopspick/services/firebase_db.dart';
import 'package:chopspick/view_model/order_view_model.dart';
import 'package:chopspick/view_model/user_view_model.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

class OpenAppConfig {
  static Future<void> startApp() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
    await setupLocator();
    await currentUser();
    await openHive();
  }

  static currentUser() async {
    await UserViewModel().currentUser();
  }

  setupDeviceSettings() {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  }

  static openHive() async {
    Directory tempDir = await getApplicationDocumentsDirectory();
    String tempPath = tempDir.path;
    Hive.init(tempPath);
    Hive.registerAdapter(ProductModelAdapter());
    await Hive.openBox(HiveBoxName.BASKET_BOX_NAME);
  }

  static setupLocator() {
    Get.lazyPut(() => UserViewModel());
    Get.lazyPut(() => OrderViewModel(), fenix: true);
    Get.lazyPut(() => BasketViewModel(), fenix: true);
    Get.lazyPut(() => OrderRepository(), fenix: true);
    Get.lazyPut(() => UserRepository(), fenix: true);
    Get.lazyPut(() => FireStoreDBService(), fenix: true);
    Get.lazyPut(() => FirebaseAuthenticationService(), fenix: true);
  }
}
