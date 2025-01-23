import 'package:football_app/domain/products/entity/products.dart';

abstract class ProductsState {}

class ProductsInitialState extends ProductsState {}

class ProductsLoading extends ProductsState {}

class ProductsLoaded extends ProductsState {
  final List<ProductsEntity> products;
  ProductsLoaded({required this.products});
}

class FailureLoadProducts extends ProductsState {}