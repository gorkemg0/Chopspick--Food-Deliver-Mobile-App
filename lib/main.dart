import 'package:chopspick/global/open_app_config.dart';
import 'package:chopspick/global/styles/theme.dart';
import 'package:chopspick/screens/landing_page/landing_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<void> main() async {
  await OpenAppConfig.startApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Chopspik',
      theme: myTheme,
      home: LandingPage(),
    );
  }
}
