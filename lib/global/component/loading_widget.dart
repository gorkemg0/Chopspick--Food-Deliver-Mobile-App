import 'package:chopspick/global/styles/custom_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 75,
      height: 75,
      child: SpinKitCubeGrid(
        color: CustomColors.myPrimary,
      ),
    );
  }
}
