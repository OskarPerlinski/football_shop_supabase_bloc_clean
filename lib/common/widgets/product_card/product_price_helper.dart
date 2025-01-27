import 'package:football_app/domain/products/entity/products.dart';

class ProductPriceHelper {
  static double provideCurrentPrice(ProductsEntity product) {
    return double.parse(product.price);
  }
}