import 'package:get/get.dart';
import 'package:project_test_03/src/feature/food_delivery/product/models/product_model.dart';

import '../base/base_controller.dart';

class ProductProvider extends BaseController {
  Future<ProductProvider> init() async {
    _products.value = List<ProductModel>.from(
        productsRaw["product_items"].map((x) => ProductModel.fromJson(x)));
    return this;
  }

  final _products = <ProductModel>[].obs;
  List<ProductModel> get products => _products;

  final _saveds = <ProductModel>[].obs;
  List<ProductModel> get saveds => _saveds;

  final _carts = <ProductModel>[].obs;
  List<ProductModel> get carts => _carts;

  updateSaved(List<ProductModel> items) {
    _saveds(items);
    refreshData();
  }

  updateCart(List<ProductModel> items) {
    _carts(items);
    refreshData();
  }

  refreshData() {
    _products.refresh();
    _saveds.refresh();
    _carts.refresh();
  }

   final Map<String, dynamic> _productsRaw = {
    "product_items": [
      {
        "id": 1,
        "name": "T-Bone Slice 300g.",
        "image_url":
            "https://images.unsplash.com/photo-1551028150-64b9f398f678?fit=crop&w=200&q=200",
        "price": 250
      },
      {
        "id": 2,
        "name": "Eggs No.1 Pack 30",
        "image_url":
            "https://images.unsplash.com/photo-1516448620398-c5f44bf9f441?fit=crop&w=200&q=200",
        "price": 149
      },
      {
        "id": 3,
        "name": "Frozen Atlantic Salmon 125g.",
        "image_url":
            "https://images.unsplash.com/photo-1599084993091-1cb5c0721cc6?fit=crop&w=200&q=200",
        "price": 98
      },
      {
        "id": 4,
        "name": "White Prawn 30pcs per kg.",
        "image_url":
            "https://images.unsplash.com/photo-1504309250229-4f08315f3b5c?fit=crop&w=200&q=200",
        "price": 299
      },
      {
        "id": 5,
        "name": "Broccoli 1kg.",
        "image_url":
            "https://images.unsplash.com/photo-1459411621453-7b03977f4bfc?fit=crop&w=200&q=200",
        "price": 96
      },
      {
        "id": 6,
        "name": "Caabbage 3kg.",
        "image_url":
            "https://images.unsplash.com/photo-1611105637889-3afd7295bdbf?fit=crop&w=200&q=200",
        "price": 129
      },
      {
        "id": 7,
        "name": "Itambé natural milk 1L.",
        "image_url":
            "https://images.unsplash.com/photo-1563636619-e9143da7973b?fit=crop&w=200&q=200",
        "price": 79
      }
    ]
  };

  Map<String, dynamic> get productsRaw => _productsRaw;
}
