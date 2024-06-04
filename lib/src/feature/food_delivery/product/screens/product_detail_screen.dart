import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_test_03/src/core/widgets/snackbar_widget.dart';

import '../controllers/product_detail_controller.dart';
import '../models/product_model.dart';

class ProductDetailScreen extends StatelessWidget {
  ProductDetailScreen({super.key});
  final _ctrl = Get.put(ProductDetailController());

  @override
  Widget build(BuildContext context) {
    ProductModel item = _ctrl.product;
    return PopScope(
      onPopInvoked: (didPop) {
        SnackBarWidget.instance.close(context);
      },
      child: Obx(
        () => Scaffold(
          appBar: AppBar(),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AspectRatio(
                    aspectRatio: 1,
                    child: Container(
                      color: Colors.amber.shade100,
                      child: Image.network(
                        item.imageUrl ?? "",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        onPressed: () {
                          _ctrl.updateProductSaved(item).then((value) {
                            String title = "Favorite product.";
                            if (!value) {
                              title = "Cancel favorite product.";
                            }
                            // SnackBarWidget.instance.close(context);
                            SnackBarWidget.instance.show(context,
                                title: title,
                                backgroundColor: value ? Colors.red : null);
                          });
                        },
                        icon: Icon(
                          _ctrl.hasSaved(item)
                              ? Icons.favorite
                              : Icons.favorite_border,
                          size: 40,
                          color:
                              _ctrl.hasSaved(item) ? Colors.red : Colors.black,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    item.name ?? "",
                    style: const TextStyle(
                        fontSize: 26, fontWeight: FontWeight.bold, height: 1.1),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "\$${item.price ?? 0.0}",
                    style: const TextStyle(
                        fontSize: 26, fontWeight: FontWeight.bold, height: 1.1),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ),
          floatingActionButton: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: SizedBox(
              height: 60,
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () {
                  _ctrl.onAddProductToCart(item);
                  String title = "Add product seccess.";
                  SnackBarWidget.instance.close(context);
                  SnackBarWidget.instance.show(context,
                      title: title, backgroundColor: Colors.green);
                },
                style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
                child: const Text(
                  "Add To Cart",
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
        ),
      ),
    );
  }
}
