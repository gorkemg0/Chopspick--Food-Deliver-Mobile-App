import 'package:flutter/material.dart';

class AssetImageWidget extends StatelessWidget {
  String imagePath;
  AssetImageWidget(this.imagePath);

  @override
  Widget build(BuildContext context) {
      return Image.asset(
        imagePath,
        height: 50,
        width: 50,
      );
  }
}
