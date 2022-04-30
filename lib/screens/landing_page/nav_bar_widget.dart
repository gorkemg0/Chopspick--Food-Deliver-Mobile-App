import 'package:badges/badges.dart';
import 'package:chopspick/global/styles/custom_colors.dart';
import 'package:chopspick/global/styles/text_style.dart';
import 'package:chopspick/screens/basket_page/basket_view_model.dart';
import 'package:chopspick/screens/basket_page/basket_page.dart';
import 'package:chopspick/screens/home_page/home_page.dart';
import 'package:chopspick/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

PersistentTabController _persistentTabController =
    PersistentTabController(initialIndex: 0);

class BottomNavBarWidget extends StatefulWidget {
  goToScreen(int index) {
    _persistentTabController.jumpToTab(index);
  }

  @override
  State<BottomNavBarWidget> createState() => _BottomNavBarWidgetState();
}

class _BottomNavBarWidgetState extends State<BottomNavBarWidget> {
  final double navBarIconSize = 35;
  BasketViewModel basketViewModel = Get.find();

  @override
  void initState() {
    super.initState();
    print("init state tetiklendi");
    basketViewModel.getLocaleBasket();
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      navBarHeight: 65,
      controller: _persistentTabController,
      screens: _buildScreens(),
      items: _navBarsItems(),
      navBarStyle: NavBarStyle.style12,
    );
  }

  List<Widget> _buildScreens() {
    return [
      HomePage(),
      Screen2(),
      BasketPage(),
      Screen4(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(Icons.home, size: navBarIconSize),
        title: ("Home"),
        activeColorPrimary: CustomColors.myPrimary,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(
          Icons.search,
          size: 35,
        ),
        title: ("Search"),
        activeColorPrimary: CustomColors.myPrimary,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: Badge(
            badgeColor: Colors.transparent,
            elevation: 0,
            position: BadgePosition.topEnd(top: -14, end: -10),
            badgeContent: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: CustomColors.myPrimary, shape: BoxShape.circle),
                  width: 20,
                  height: 20,
                ),
                Obx(() => Text(
                    basketViewModel.totalItemsLength.value.toString(),
                    style: TextStyles.cartTextStyle)),
              ],
            ),
            child: Icon(Icons.shopping_cart, size: navBarIconSize)),
        title: ("Shop"),
        activeColorPrimary: CustomColors.myPrimary,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.person_outlined, size: navBarIconSize),
        title: ("Profile"),
        activeColorPrimary: CustomColors.myPrimary,
        inactiveColorPrimary: Colors.grey,
      ),
    ];
  }
}
