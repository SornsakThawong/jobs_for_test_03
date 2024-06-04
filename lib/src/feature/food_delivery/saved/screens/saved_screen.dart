import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:project_test_03/src/core/widgets/snackbar_widget.dart';

import '../../product/models/product_model.dart';
import '../controllers/saved_controller.dart';

class SavedScreen extends StatelessWidget {
  SavedScreen({super.key});
  final _ctrl = Get.put(SavedController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Saved",
        ),
      ),
      body: Obx(
        () => _ctrl.saveds.isEmpty
            ? const SizedBox()
            : ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                itemCount: _ctrl.products.length,
                itemBuilder: (context, index) {
                  ProductModel item = _ctrl.products[index];
                  if (!_ctrl.hasSaved(item)) {
                    return const SizedBox();
                  }
                  return slidableBody(item);
                },
                separatorBuilder: (context, index) {
                  ProductModel item = _ctrl.products[index];
                  return SizedBox(
                    height: !_ctrl.hasSaved(item) ? 0 : 15,
                  );
                }),
      ),
    );
  }

  Widget slidableBody(ProductModel item) {
    return Slidable(
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            onPressed: (context) {
              _ctrl.removeProductInSaved(item);
              String title = "Cancel favorite product.";
              SnackBarWidget.instance.close(context);
              SnackBarWidget.instance.show(
                context,
                title: title,
              );
            },
            backgroundColor: Colors.red,
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: 'Delete',
          ),
        ],
      ),
      child: GestureDetector(
        onTap: () => _ctrl.onDetail(item.id!),
        child: Container(
          height: 100,
          decoration: BoxDecoration(
            border: Border.all(),
          ),
          child: Row(
            children: [
              AspectRatio(
                aspectRatio: 1,
                child: Image.network(
                  item.imageUrl ?? "",
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.name ?? "",
                      style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          height: 1.2),
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
              const SizedBox(
                width: 15,
              ),
              Container(
                height: 50,
                width: 50,
                decoration:
                    BoxDecoration(border: Border.all(), shape: BoxShape.circle),
                child: Center(
                    child: Text(
                  _ctrl.getQty(item).toString(),
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                )),
              ),
              const SizedBox(
                width: 15,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
