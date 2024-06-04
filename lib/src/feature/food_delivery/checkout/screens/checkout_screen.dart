import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_test_03/src/feature/food_delivery/checkout/controllers/checkout_controller.dart';
import 'package:qr_flutter/qr_flutter.dart';

class CheckoutScreen extends StatelessWidget {
  CheckoutScreen({super.key});
  final _ctrl = Get.put(CheckoutController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                AspectRatio(
                  aspectRatio: 1,
                  child: QrImageView(
                    data: _ctrl.url,
                    version: QrVersions.auto,
                    size: 200.0,
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                const Text(
                  "Scan & Pay",
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "\$${_ctrl.totalPrice.toString()}",
                  style: const TextStyle(
                      fontSize: 28, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
