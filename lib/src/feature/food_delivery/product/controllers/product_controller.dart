// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:get/get.dart';
import 'package:project_test_03/src/feature/food_delivery/product/controllers/base_products_controller.dart';
import 'package:project_test_03/src/feature/food_delivery/product/models/product_model.dart';

import '../../../../routers/route_path.dart';

class ProductController extends BaseProductsController {
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

  onDetail(int productId) {
    Get.toNamed(RoutePath.detail, arguments: productId);
  }
}
