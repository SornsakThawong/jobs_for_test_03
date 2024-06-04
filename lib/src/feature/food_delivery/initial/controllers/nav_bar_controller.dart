import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/base/base_controller.dart';
import '../../cart/screens/cart_screen.dart';
import '../../product/screens/product_screen.dart';
import '../../saved/screens/saved_screen.dart';

class NavBarController extends BaseController {
  final _selectedIndex = 0.obs;
  int get selectedIndex => _selectedIndex.value;

  onSelectIndex(int index) {
    _selectedIndex(index);
  }

  final List<Widget> screens = [
    ProductScreen(),
    SavedScreen(),
    CartScreen(),
  ];
}
