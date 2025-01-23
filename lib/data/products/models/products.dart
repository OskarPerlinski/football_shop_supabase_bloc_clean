import 'dart:convert';

import 'package:football_app/domain/products/entity/products.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first

class ProductsModel {
  final String id;
  final String createdAt;
  final String name;
  final String price;
  List<String> images;
  final String raiting;
  final String size;
  final String description;
  final String brand;
  final String collections;

  ProductsModel({
    required this.id,
    required this.createdAt,
    required this.name,
    required this.price,
    required this.images,
    required this.raiting,
    required this.size,
    required this.description,
    required this.brand,
    required this.collections,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'createdAt': createdAt,
      'name': name,
      'price': price,
      'images': images,
      'raiting': raiting,
      'size': size,
      'description': description,
      'brand': brand,
      'collections': collections,
    };
  }

  factory ProductsModel.fromMap(Map<String, dynamic> map) {
    return ProductsModel(
      id: map['id'] as String,
      createdAt: map['createdAt'] as String,
      name: map['name'] as String,
      price: map['price'] as String,
      images: map['images'] is String
          ? (map['images'] as String).split(', ')
          : List<String>.from(map['images']),
      raiting: map['raiting'] as String,
      size: map['size'] as String,
      description: map['description'] as String,
      brand: map['brand'] as String,
      collections: map['collections'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductsModel.fromJson(String source) =>
      ProductsModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

extension ProductsXModel on ProductsModel {
  ProductsEntity toEntity() {
    return ProductsEntity(
      id: id,
      createdAt: createdAt,
      name: name,
      price: price,
      images: images,
      raiting: raiting,
      size: size,
      description: description,
      brand: brand,
      collections: collections,
    );
  }
}
