// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:get/get.dart';
import 'package:project_test_03/src/feature/food_delivery/product/controllers/base_products_controller.dart';

import '../models/product_model.dart';

class ProductDetailController extends BaseProductsController {
  final _product = ProductModel().obs;
  ProductModel get product => _product.value;

  Future<bool> updateProductSaved(ProductModel item) async {
    bool result = false;
    List<ProductModel> _saveds = saveds.map((e) => e.copyWith()).toList();
    if (hasSaved(item)) {
      _saveds.removeWhere((element) => element.id == item.id);
    } else {
      _saveds.add(item);
      result = true;
    }
    updateSaved(_saveds);
    return result;
  }

  onAddProductToCart(ProductModel item) {
    List<ProductModel> _carts = carts.map((e) => e.copyWith()).toList();

    if (hasCart(item)) {
      int getItemIndex = carts.indexWhere((element) => element.id == item.id);
      _carts[getItemIndex].qty = _carts[getItemIndex].qty! + 1;
    } else {
      item.qty = 1;
      _carts.add(item);
    }
    updateCart(_carts);
  }

  @override
  void onInit() {
    _product.value =
        products.firstWhere((element) => element.id == Get.arguments);
    super.onInit();
  }
}
