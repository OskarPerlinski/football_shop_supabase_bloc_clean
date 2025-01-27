import 'package:football_app/domain/cart/entity/product_ordered.dart';

class CartHelper {
  static double calculateCartTotalSubtotal(List<ProductOrderedEntity> products) {
    double subtotalPrice = 0;
    for (var item in products) {
      subtotalPrice += item.totalPrice.isNotEmpty 
          ? double.parse(item.totalPrice) 
          : 0;
    }
    return subtotalPrice;
  }
}