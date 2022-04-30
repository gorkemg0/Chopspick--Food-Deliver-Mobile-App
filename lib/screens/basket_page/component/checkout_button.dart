import 'package:chopspick/global/styles/text_style.dart';
import 'package:chopspick/models/order_model.dart';
import 'package:chopspick/screens/basket_page/basket_view_model.dart';
import 'package:chopspick/screens/landing_page/nav_bar_widget.dart';
import 'package:chopspick/view_model/order_view_model.dart';
import 'package:chopspick/view_model/user_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckOutButton extends StatelessWidget {
  TextEditingController textEditingController;

  CheckOutButton(this.textEditingController);

  BasketViewModel basketViewModel = Get.find();
  OrderViewModel orderViewModel = Get.find();
  UserViewModel userViewModel = Get.find();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        if (orderViewModel.state==ViewStateOrder.idle) {
          if (basketViewModel.products.length > 0) {
            orderViewModel.state = ViewStateOrder.Paying;
            OrderModel orderModel = OrderModel(
                userID: userViewModel.user!.userID!,
                adress: "adress info",
                name: userViewModel.user!.userName!,
                message: textEditingController.text,
                totalPrice: basketViewModel.totalPrice.value);
            await orderViewModel.createOrder(
                products: basketViewModel.products, order: orderModel);
            await Future.delayed(Duration(seconds: 1));
            basketViewModel.clearBasket();
            textEditingController.clear();
            BottomNavBarWidget().goToScreen(0);
            Get.defaultDialog(
              title: "Success",
              content: Column(
                children: [
                  Icon(
                    Icons.check,
                    color: Colors.green,
                    size: 70,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                      "Payment successful. Our courier will deliver the delicious food to you as soon as possible. Enjoy your meal.",
                      style: TextStyles.dialogTextStyle),
                ],
              ),
              textCancel: "Close",
            );
          } else {
            Get.snackbar("ERROR", "There are no items in the cart");
          }
        }
      },
      child: Container(
        width: 300,
        height: 40,
        margin: EdgeInsets.only(top: 5, bottom: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(17),
          color: Color(0xffCC1A74),
        ),
        child: Center(
          child: Text(
            'Checkout',
            textAlign: TextAlign.center,
            style: TextStyles.myPoppinsTextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
