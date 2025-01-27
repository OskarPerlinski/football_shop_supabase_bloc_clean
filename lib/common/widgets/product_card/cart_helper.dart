import 'package:football_app/domain/cart/entity/product_ordered.dart';

class CartHelper {
  static double calculateCartTotalSubtotal(
      List<ProductOrderedEntity> products) {
    double subtotalPrice = 0.0;

    for (var item in products) {
      double itemPrice = double.tryParse(item.price) ?? 0.0;
      subtotalPrice += itemPrice;
    }

    return subtotalPrice;
  }
}
