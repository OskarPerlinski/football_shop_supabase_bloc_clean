class ProductOrderedEntity {
  final String createdAt;
  final String productId;
  final String name;
  final String price;
  final String images;
  final String size;
  final String quantity;
  final String id;
  final String totalPrice;

  ProductOrderedEntity({
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
}