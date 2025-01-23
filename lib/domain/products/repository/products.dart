import 'package:dartz/dartz.dart';

abstract class ProductsReposiotry{
  Future<Either> getNewProducts();
}