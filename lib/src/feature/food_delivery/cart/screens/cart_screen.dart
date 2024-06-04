import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';

import '../../../../core/widgets/snackbar_widget.dart';
import '../../product/models/product_model.dart';
import '../controllers/cart_controller.dart';

class CartScreen extends StatelessWidget {
  CartScreen({super.key});
  final _ctrl = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Cart",
        ),
      ),
      body: Obx(
        () => _ctrl.carts.isEmpty
            ? const SizedBox()
            : ListView.separated(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                itemCount: _ctrl.products.length,
                itemBuilder: (context, index) {
                  ProductModel item = _ctrl.products[index];
                  if (!_ctrl.hasCart(item)) {
                    return const SizedBox();
                  }
                  return slidableBody(item, index);
                },
                separatorBuilder: (context, index) {
                  ProductModel item = _ctrl.products[index];
                  return SizedBox(
                    height: !_ctrl.hasCart(item) ? 0 : 15,
                  );
                }),
      ),
      bottomNavigationBar: Container(
        height: 60,
        padding: const EdgeInsets.symmetric(horizontal: 15),
        decoration: BoxDecoration(
          border: Border.all(),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Obx(
              () => Text(
                "Total : ${_ctrl.totalPrice}",
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            OutlinedButton(
              onPressed: () => _ctrl.onCheckout(),
              child: const Text(
                'Checkout',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget slidableBody(ProductModel item, int index) {
    return Slidable(
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            onPressed: (context) {
              _ctrl.removeProductInCart(item);
              String title = "Delete product success.";
              SnackBarWidget.instance.close(context);
              SnackBarWidget.instance.show(
                context,
                title: title,
                backgroundColor: Colors.red,
              );
            },
            backgroundColor: Colors.red,
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: 'Delete',
          ),
        ],
      ),
      child: Container(
        height: 120,
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
                        fontSize: 20, fontWeight: FontWeight.bold, height: 1.2),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    "\$${item.price ?? 0.0}",
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold, height: 1.1),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      button1(
                        Icons.remove,
                        () {
                          _ctrl.decreaseQtyProduct(item.id!);
                        },
                      ),
                      Container(
                        height: 40,
                        width: 40,
                        decoration: const BoxDecoration(
                          border: Border(
                            top: BorderSide(),
                            bottom: BorderSide(),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            _ctrl.getQty(item).toString(),
                            style: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      button1(
                        Icons.add,
                        () {
                          _ctrl.increaseQtyProduct(item.id!);
                        },
                      ),
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(
              width: 15,
            ),
          ],
        ),
      ),
    );
  }

  Widget button1(IconData icon, Function() onTap) {
    double radius = 10.0;
    BorderRadius borderRadius = icon == Icons.add
        ? BorderRadius.only(
            topRight: Radius.circular(radius),
            bottomRight: Radius.circular(radius),
          )
        : BorderRadius.only(
            topLeft: Radius.circular(radius),
            bottomLeft: Radius.circular(radius),
          );
    return ClipRRect(
      borderRadius: borderRadius,
      child: Material(
        shape: RoundedRectangleBorder(
            borderRadius: borderRadius, side: const BorderSide()),
        child: InkWell(
          onTap: onTap,
          child: SizedBox(
            height: 40,
            width: 40,
            child: Icon(icon),
          ),
        ),
      ),
    );
  }
}
