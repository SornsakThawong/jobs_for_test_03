// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:get/get.dart';
import 'package:project_test_03/src/feature/food_delivery/product/controllers/base_products_controller.dart';

import '../../../../routers/route_path.dart';
import '../../product/models/product_model.dart';

class CartController extends BaseProductsController {
  final _totalPrice = 0.0.obs;
  double get totalPrice => _totalPrice.value;

  increaseQtyProduct(int productId) {
    List<ProductModel> _carts = carts.map((e) => e.copyWith()).toList();
    int getItemIndex = carts.indexWhere((element) => element.id == productId);
    _carts[getItemIndex].qty = _carts[getItemIndex].qty! + 1;
    updateCart(_carts);
    updateTotalPrice();
  }

  decreaseQtyProduct(
    int productId,
  ) {
    List<ProductModel> _carts = carts.map((e) => e.copyWith()).toList();
    int getItemIndex = carts.indexWhere((element) => element.id == productId);
    if (_carts[getItemIndex].qty! <= 1) return;
    _carts[getItemIndex].qty = _carts[getItemIndex].qty! - 1;
    updateCart(_carts);
    updateTotalPrice();
  }

  removeProductInCart(ProductModel item) {
    List<ProductModel> _carts = carts.map((e) => e.copyWith()).toList();
    _carts.removeWhere((element) => element.id == item.id);
    updateCart(_carts);
    updateTotalPrice();
  }

  int getQty(ProductModel item) {
    List<ProductModel> _product =
        carts.where((element) => element.id == item.id).toList();
    if (_product.isNotEmpty) {
      return _product.first.qty ?? 0;
    }
    return 0;
  }

  updateTotalPrice() {
    _totalPrice(getTotalPrice().toDouble());
  }

  num getTotalPrice() {
    if (carts.isEmpty) return 0.0;
    return carts
        .map((e) => e.price! * e.qty!)
        .reduce((value, element) => value + element);
  }

  onCheckout() {
    Get.toNamed(RoutePath.checkout, arguments: getTotalPrice().toString());
  }

  @override
  void onInit() {
    updateTotalPrice();
    super.onInit();
  }
}
