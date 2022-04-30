import 'package:chopspick/global/component/custom_icons.dart';
import 'package:chopspick/global/styles/custom_colors.dart';
import 'package:flutter/material.dart';

class AppBarNotificationIcon extends StatelessWidget {
  const AppBarNotificationIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          Container(
            child: const Icon(
              CustomIcons.notification,
              size: 23.0,
              color: Colors.black,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(right: 3, top: 1),
            width: 6,
            height: 6,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: CustomColors.notificationIconCircle,
            ),
          ),
        ],
      ),
    );
  }
}
