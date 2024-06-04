// To parse this JSON data, do
//
//     final productModel = productModelFromJson(jsonString);

import 'dart:convert';

List<ProductModel> productModelFromJson(String str) => List<ProductModel>.from(json.decode(str).map((x) => ProductModel.fromJson(x)));

String productModelToJson(List<ProductModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductModel {
    int? id;
    String? name;
    String? imageUrl;
    num? price;
    int? qty;

    ProductModel({
        this.id,
        this.name,
        this.imageUrl,
        this.price,
        this.qty,
    });

    ProductModel copyWith({
        int? id,
        String? name,
        String? imageUrl,
        num? price,
        int? qty,
    }) => 
        ProductModel(
            id: id ?? this.id,
            name: name ?? this.name,
            imageUrl: imageUrl ?? this.imageUrl,
            price: price ?? this.price,
            qty: qty?? this.qty,
        );

    factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json["id"] ?? 0,
        name: json["name"] ?? "",
        imageUrl: json["image_url"] ?? "",
        price: json["price"] ?? 0,
        qty: json["qty"] ?? 0,
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image_url": imageUrl,
        "price": price,
        "qty": qty,
    };
}
