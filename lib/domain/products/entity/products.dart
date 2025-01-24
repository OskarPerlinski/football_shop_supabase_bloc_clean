class ProductsEntity {
  final String id;
  final String createdAt;
  final String name;
  final String price;
  final List<String> images;
  final List<String> size;
  final String raiting;
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
