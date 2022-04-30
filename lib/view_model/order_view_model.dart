import 'package:chopspick/models/order_model.dart';
import 'package:chopspick/models/product_model/product_model.dart';
import 'package:chopspick/repository/user_repository.dart';
import 'package:get/get.dart';

enum ViewStateOrder { idle, Paying, Busy }

class OrderViewModel {
  Rx<ViewStateOrder> _state = ViewStateOrder.idle.obs;
  UserRepository _userRepository = Get.find<UserRepository>();
  RxList<ProductModel> orderProducts = <ProductModel>[].obs;
  String? category;

  ViewStateOrder get state => _state.value;

  set state(ViewStateOrder value) {
    _state.value = value;
  }

  Future<void> addProduct({required ProductModel productModel}) async {
    await _userRepository.addProduct(productModel: productModel);
  }

  Future<List<ProductModel>> getProductsItem() async {
    orderProducts.value.clear();
    orderProducts.value =
        await _userRepository.getProductsItem(category: category);
    return orderProducts.value;
  }

  Future<bool> createOrder({
    required List<ProductModel> products,
    required OrderModel order,
  }) async {
    _state.value = ViewStateOrder.Paying;
    var result =
        await _userRepository.createOrder(products: products, order: order);
    _state.value = ViewStateOrder.idle;
    return result;
  }
}
