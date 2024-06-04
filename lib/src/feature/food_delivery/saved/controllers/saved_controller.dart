// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:get/get.dart';
import 'package:project_test_03/src/feature/food_delivery/product/controllers/base_products_controller.dart';
import 'package:project_test_03/src/routers/route_path.dart';

import '../../product/models/product_model.dart';

class SavedController extends BaseProductsController {
  removeProductInSaved(ProductModel item) {
    List<ProductModel> _saveds = saveds.map((e) => e.copyWith()).toList();
    _saveds.removeWhere((element) => element.id == item.id);
    updateSaved(_saveds);
  }

  clearSaved() {
    updateSaved([]);
  }

  int getQty(ProductModel item) {
    List<ProductModel> _product =
        carts.where((element) => element.id == item.id).toList();
    if (_product.isNotEmpty) {
      return _product.first.qty ?? 0;
    }
    return 0;
  }

  onDetail(int productId) {
    Get.toNamed(RoutePath.detail, arguments: productId);
  }
}
