class ProductsEntity {
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

  ProductsEntity({
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
}
