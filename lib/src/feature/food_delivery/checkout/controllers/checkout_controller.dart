import 'package:get/get.dart';

import '../../../../core/base/base_controller.dart';

class CheckoutController extends BaseController {
  final _totalPrice = 0.0.obs;
  num get totalPrice => _totalPrice.value;

  final _url = "".obs;
  String get url => _url.value;

  @override
  void onInit() {
    _totalPrice(double.parse(Get.arguments.toString()));
    _url.value = "$_url?price=$totalPrice";
    super.onInit();
  }
}
