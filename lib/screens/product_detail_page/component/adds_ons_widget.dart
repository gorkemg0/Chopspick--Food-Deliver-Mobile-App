import 'package:chopspick/global/component/custom_icons.dart';
import 'package:chopspick/global/styles/custom_colors.dart';
import 'package:flutter/material.dart';

class AddsOnsWidget extends StatelessWidget {
  Widget child;
  AddsOnsWidget(this.child);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 65,
      height: 65,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: CustomColors.productsCartBackground,
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            child: Center(child: child),
          ),
          Positioned(
            right: -8,
            bottom: -8,
            child: Icon(
              CustomIcons.filled_add,
              color: CustomColors.productAddIcon,
              size: 20,
            ),
          ),
        ],
      ),
    );
  }
}
