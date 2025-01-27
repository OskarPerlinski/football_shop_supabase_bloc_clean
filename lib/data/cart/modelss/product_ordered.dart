// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:football_app/domain/cart/entity/product_ordered.dart';

class ProductOrderedModel {
  final String createdAt;
  final String productId;
  final String name;
  final String price;
  final String images;
  final String size;
  final String quantity;
  final String id;
  final String totalPrice;

  ProductOrderedModel({
    required this.createdAt,
    required this.productId,
    required this.name,
    required this.price,
    required this.images,
    required this.quantity,
    required this.size,
    required this.id,
    required this.totalPrice,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'createdAt': createdAt,
      'productId': productId,
      'name': name,
      'price': price,
      'imgaes': images,
      'size': size,
      'quantity': quantity,
      'id': id,
      'totalPrice': totalPrice,
    };
  }

  factory ProductOrderedModel.fromMap(Map<String, dynamic> map) {
    return ProductOrderedModel(
      createdAt: map['createdAt'] as String,
      productId: map['productId'] as String,
      name: map['name'] as String,
      price: map['price'] as String,
      images: map['images'] as String,
      size: map['size'] as String,
      quantity: map['quantity'] as String,
      id: map['id'] as String,
      totalPrice: map['totalPrice'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductOrderedModel.fromJson(String source) =>
      ProductOrderedModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

extension ProductOrderedXModel on ProductOrderedModel {
  ProductOrderedEntity toEntity() {
    return ProductOrderedEntity(
      createdAt: createdAt,
      productId: productId,
      name: name,
      price: price,
      images: images,
      quantity: quantity,
      size: size,
      id: id,
      totalPrice: totalPrice,
    );
  }
}
