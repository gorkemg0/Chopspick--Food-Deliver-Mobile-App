import 'package:cached_network_image/cached_network_image.dart';
import 'package:chopspick/global/component/custom_icons.dart';
import 'package:chopspick/global/styles/custom_colors.dart';
import 'package:chopspick/global/styles/text_style.dart';
import 'package:chopspick/models/product_model/product_model.dart';
import 'package:chopspick/screens/basket_page/basket_view_model.dart';
import 'package:flutter/material.dart';

class ListViewBuilderItems extends StatelessWidget {
  BasketViewModel basketViewModel;
  int index;

  ListViewBuilderItems(this.basketViewModel, this.index);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(6),
          margin: EdgeInsets.symmetric(vertical: 5),
          decoration: BoxDecoration(
              color: Colors.black12, borderRadius: BorderRadius.circular(16)),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              itemsProductCart(
                CachedNetworkImage(
                  imageUrl: basketViewModel.products[index].photoUrl,
                  imageBuilder: (context, imageProvider) => Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  placeholder: (context, url) => CircularProgressIndicator(),
                  errorWidget: (context, url, error) => const Icon(
                    Icons.error,
                    color: Colors.red,
                  ),
                ),
              ),
              SizedBox(
                width: 12,
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          basketViewModel.products[index].productName,
                          style: TextStyles.myPoppinsTextStyle(
                              color: CustomColors.productName,
                              fontSize: 17,
                              fontWeight: FontWeight.w500),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: Text(
                            r'$'
                            '${basketViewModel.products[index].productPrice}',
                            style: TextStyles.myPoppinsTextStyle(
                              color: CustomColors.productPriceText,
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 60,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              takeOutBasket(
                                  productModel:
                                      basketViewModel.products[index]),
                              Text(
                                '${basketViewModel.products[index].productAmount}',
                                style: TextStyles.myPoppinsTextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              addBasket(
                                  productModel:
                                      basketViewModel.products[index]),
                            ],
                          ),
                        )
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        basketViewModel.removeBasket(index: index);
                      },
                      child: const Padding(
                        padding: EdgeInsets.only(right: 6),
                        child: Icon(
                          CustomIcons.cancel,
                          color: CustomColors.basketDeleteIcon,
                          size: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  GestureDetector addBasket({required ProductModel productModel}) {
    return GestureDetector(
      onTap: () {
        productModel.productAmount++;
        basketViewModel.updateBasket(productModel: productModel);
      },
      child: const Icon(
        CustomIcons.add,
        size: 16,
        color: CustomColors.myPrimary,
      ),
    );
  }

  GestureDetector takeOutBasket({required ProductModel productModel}) {
    return GestureDetector(
      onTap: () {
        if (productModel.productAmount > 1) {
          productModel.productAmount--;
          basketViewModel.updateBasket(productModel: productModel);
        }
      },
      child: const Icon(
        CustomIcons.minus,
        size: 16,
        color: CustomColors.myPrimary,
      ),
    );
  }

  Container itemsProductCart(child) {
    return Container(
      width: 90,
      height: 90,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: CustomColors.productsCartBackground,
      ),
      child: Padding(
        child: child,
        padding: EdgeInsets.all(5),
      ),
    );
  }
}
