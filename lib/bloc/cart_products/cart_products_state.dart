import 'package:football_app/domain/cart/entity/product_ordered.dart';

abstract class CartProductsState {}

class CartProductsLoading extends CartProductsState {}

class CartProductsLoaded extends CartProductsState {
  final List<ProductOrderedEntity> products;
  CartProductsLoaded({required this.products});
}

class FailureLoadCartProducts extends CartProductsState {}
