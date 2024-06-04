import 'package:get/get.dart';
import 'package:project_test_03/src/feature/food_delivery/product/models/product_model.dart';

import '../../../../core/base/base_controller.dart';
import '../../../../core/providers/product_provider.dart';

class BaseProductsController extends BaseController {
  final _productProvider = Get.find<ProductProvider>();

  List<ProductModel> get products => _productProvider.products;
  List<ProductModel> get saveds => _productProvider.saveds;
  List<ProductModel> get carts => _productProvider.carts;

  bool hasSaved(ProductModel item) =>
      saveds.where((element) => element.id == item.id).isNotEmpty;

  bool hasCart(ProductModel item) =>
      carts.where((element) => element.id == item.id).isNotEmpty;

  ProductModel getProductItem(int productId) {
    return products.where((element) => element.id == productId).first;
  }

  ProductModel getProductInSaveItem(int productId) {
    return saveds.where((element) => element.id == productId).first;
  }

  ProductModel getProductInCartItem(int productId) {
    return carts.where((element) => element.id == productId).first;
  }

  updateSaved(List<ProductModel> items) {
    _productProvider.updateSaved(items);
  }

  updateCart(List<ProductModel> items) {
    _productProvider.updateCart(items);
  }
}
