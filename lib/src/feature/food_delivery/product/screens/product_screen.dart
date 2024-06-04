import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_test_03/src/core/widgets/snackbar_widget.dart';

import '../controllers/product_controller.dart';
import '../models/product_model.dart';

class ProductScreen extends StatelessWidget {
  ProductScreen({super.key});
  final _ctrl = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Recommendation",
        ),
      ),
      body: Obx(
        () => GridView.builder(
          padding: const EdgeInsets.all(15),
          itemCount: _ctrl.products.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 15,
              crossAxisSpacing: 15,
              // childAspectRatio: 9 / 12,
              mainAxisExtent: 260),
          itemBuilder: (context, index) {
            ProductModel item = _ctrl.products[index];

            return GestureDetector(
              onTap: () => _ctrl.onDetail(item.id!),
              child: Container(
                // color: Colors.red,
                decoration: BoxDecoration(border: Border.all()),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AspectRatio(
                      aspectRatio: 1,
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          Image.network(
                            item.imageUrl ?? "",
                            fit: BoxFit.cover,
                          ),
                          Positioned(
                            top: 10,
                            right: 10,
                            child: GestureDetector(
                              onTap: () {
                                _ctrl.updateProductSaved(item).then((value) {
                                  String title = "Favorite product.";
                                  if (!value) {
                                    title = "Cancel favorite product.";
                                  }
                                  SnackBarWidget.instance.close(context);
                                  SnackBarWidget.instance.show(context,
                                      title: title,
                                      backgroundColor:
                                          value ? Colors.red : null);
                                });
                              },
                              child: Icon(
                                Icons.favorite,
                                size: 40,
                                color: _ctrl.hasSaved(item)
                                    ? Colors.red
                                    : Colors.white,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item.name ?? "",
                              style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  height: 1.1),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text(
                              "\$${item.price ?? 0.0}",
                              style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  height: 1.1),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
