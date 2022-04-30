import 'package:chopspick/global/component/image_path.dart';
import 'package:chopspick/global/component/product_category.dart';
import 'package:chopspick/global/styles/custom_colors.dart';
import 'package:chopspick/global/styles/text_style.dart';
import 'package:chopspick/view_model/order_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryListView extends StatefulWidget {
  @override
  State<CategoryListView> createState() => _CategoryListViewState();
}

class _CategoryListViewState extends State<CategoryListView> {
  OrderViewModel orderViewModel = Get.find();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 140,
      child: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          foodCategory(ImagePath.hamburger, null, text: 'All'),
          foodCategory(ImagePath.hamburger, ProductCategory.HAMBURGER,
              text: 'Burger'),
          foodCategory(ImagePath.pizza, ProductCategory.PIZZA, text: 'Pizza'),
          foodCategory(ImagePath.kebab, ProductCategory.KEBAB, text: 'Kebab'),
          foodCategory(ImagePath.dessert, ProductCategory.DESSTERT,
              text: 'Dessert'),
        ],
        scrollDirection: Axis.horizontal,
      ),
    );
  }

  GestureDetector foodCategory(String imagePath, String? categoryName,
      {String text = ''}) {
    return GestureDetector(
      onTap: () {
        orderViewModel.category = categoryName;
        setState(() {});
        orderViewModel.getProductsItem();
      },
      child: CategoryCardItem(
        text: text,
        categoryName: categoryName,
        imagePath: imagePath,
        orderViewModel: orderViewModel,
      ),
    );
  }
}

class CategoryCardItem extends StatelessWidget {
  final String text;
  final String? categoryName;
  final String imagePath;
  OrderViewModel orderViewModel;

  CategoryCardItem(
      {required this.text,
      this.categoryName,
      required this.imagePath,
      required this.orderViewModel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20, right: 12),
      child: Column(
        children: [
          Container(
            width: 65,
            height: 65,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: orderViewModel.category == categoryName
                  ? CustomColors.categorySelected
                  : CustomColors.categoryUnselected,
            ),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Positioned(
                  child: Center(child: Image.asset(imagePath)),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 15),
            child: Text(
              text,
              style: TextStyles.myPoppinsTextStyle(
                color: CustomColors.categoryDescriptionText,
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),
            ),
          )
        ],
      ),
    );
  }
}
