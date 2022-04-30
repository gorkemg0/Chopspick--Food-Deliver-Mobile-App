import 'package:chopspick/global/component/hive_box_names.dart';
import 'package:chopspick/models/product_model/product_model.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

class BasketViewModel extends GetxController {
  RxList<ProductModel> products = <ProductModel>[].obs;
  RxInt totalPrice = 0.obs;
  RxInt totalItemsLength=0.obs;

  setBasket() {
    totalPrice.value = 0;
    totalItemsLength.value=0;
    products.forEach((element) {
      totalPrice.value =
          totalPrice.value + (element.productPrice * element.productAmount);
      totalItemsLength.value=totalItemsLength.value+element.productAmount;
    });
    updateLocaleDB();
  }

  addBasket({required ProductModel productModel}) {
    bool isAlreadyHave = false;
    products.value.forEach((element) {
      if(element.productID==productModel.productID){
        isAlreadyHave=true;
        element.productAmount++;
      }
    });
    if (isAlreadyHave!=true) {
      products.value.add(productModel);
    }
    setBasket();
  }

  updateBasket({required ProductModel productModel}) {
    products.value.forEach((element) {
      if(element.productID==productModel.productID){
        element=productModel;
      }
    });
    setBasket();
  }

  clearBasket(){
    products.value.clear();
    setBasket();
  }

  getLocaleBasket()async{
    products.value.clear();
    var box = Hive.box(HiveBoxName.BASKET_BOX_NAME);
    for(int i =0; i<box.length; i++){
      products.add(box.getAt(i));
    }
    setBasket();
  }

  updateLocaleDB(){
    var box = Hive.box(HiveBoxName.BASKET_BOX_NAME);
    box.clear();
    box.addAll(products.value);
  }

  removeBasket({required int index}) {
    products.value.removeAt(index);
    setBasket();
  }
}
