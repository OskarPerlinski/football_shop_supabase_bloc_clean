// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:football_app/domain/cart/entity/cart.dart';

class CartModel {
  final String createdAt;
  final String productId;
  final String name;
  final String price;
  final String imgaes;
  final String size;
  final String quantity;
  final String totalPrice;

  CartModel({
    required this.createdAt,
    required this.productId,
    required this.name,
    required this.price,
    required this.imgaes,
    required this.quantity,
    required this.size,
    required this.totalPrice,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'createdAt': createdAt,
      'productId': productId,
      'name': name,
      'price': price,
      'imgaes': imgaes,
      'quantity': quantity,
      'size': size,
      'totalPrice': totalPrice,
    };
  }

  factory CartModel.fromMap(Map<String, dynamic> map) {
    return CartModel(
      createdAt: map['createdAt'] as String,
      productId: map['productId'] as String,
      name: map['name'] as String,
      price: map['price'] as String,
      imgaes: map['imgaes'] as String,
      quantity: map['quantity'] as String,
      size: map['size'] as String,
      totalPrice: map['totalPrice'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory CartModel.fromJson(String source) =>
      CartModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

extension CartXModel on CartModel {
  CartEntity toEntity() {
    return CartEntity(
      createdAt: createdAt,
      productId: productId,
      name: name,
      price: price,
      imgaes: imgaes,
      quantity: quantity,
      size: size,
      totalPrice: totalPrice,
    );
  }
}
