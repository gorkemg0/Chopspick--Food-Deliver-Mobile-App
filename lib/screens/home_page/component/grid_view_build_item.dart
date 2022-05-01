import 'package:cached_network_image/cached_network_image.dart';
import 'package:chopspick/global/component/custom_icons.dart';
import 'package:chopspick/global/styles/custom_colors.dart';
import 'package:chopspick/global/styles/text_style.dart';
import 'package:chopspick/models/product_model/product_model.dart';
import 'package:chopspick/screens/basket_page/basket_view_model.dart';
import 'package:chopspick/screens/product_detail_page/product_details_details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GridViewBuilderProductItem extends StatelessWidget {
  ProductModel product;
  BasketViewModel basketViewModel;
  GridViewBuilderProductItem(this.product,this.basketViewModel);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        bool isAlreadyHave = false;
        basketViewModel.products.value.forEach((element) {
          if(element.productID==product.productID){
            isAlreadyHave=true;
            Get.to(()=>ProductDetailsPage(
              productModel: element,isAlreadyHave: true,));
          }
        });
        if (isAlreadyHave!=true) {
          Get.to(() => ProductDetailsPage(
            productModel: product,
          ));
        }
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color.fromRGBO(217, 201, 201, .87),
              Color.fromRGBO(213, 211, 211, .43)
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 80,
              child: CachedNetworkImage(
                imageUrl: product.photoUrl,
                imageBuilder: (context, imageProvider) => Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                placeholder: (context, url) => Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => const Icon(
                  Icons.error,
                  color: Colors.red,
                ),
              ),
            ),
            Text(
              product.productName,
              style: TextStyles.myPoppinsTextStyle(
                color: Colors.black,
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    r'$' + product.productPrice.toString(),
                    style: TextStyles.myPoppinsTextStyle(
                      color: CustomColors.productPriceText,
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      basketViewModel.addBasketOne(productModel: product);
                    },
                    child: Icon(
                      CustomIcons.filled_add,
                      color: CustomColors.productAddIcon,
                      size: 20,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}