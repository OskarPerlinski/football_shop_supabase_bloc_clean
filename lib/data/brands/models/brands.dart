// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:football_app/domain/brands/entity/brands.dart';

class BrandsModels {
  final String id;
  final String brand;
  final String image;

  BrandsModels({
    required this.id,
    required this.brand,
    required this.image,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'brand': brand,
      'image': image,
    };
  }

  factory BrandsModels.fromMap(Map<String, dynamic> map) {
    return BrandsModels(
      id: map['id'] as String,
      brand: map['brand'] as String,
      image: map['image'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory BrandsModels.fromJson(String source) =>
      BrandsModels.fromMap(json.decode(source) as Map<String, dynamic>);
}

extension BrandsXModels on BrandsModels {
  BrandsEntity toEntity() {
    return BrandsEntity(
      id: id,
      brand: brand,
      image: image,
    );
  }
}
