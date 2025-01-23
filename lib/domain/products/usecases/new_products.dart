import 'package:dartz/dartz.dart';
import 'package:football_app/core/usecases/usecases.dart';
import 'package:football_app/domain/products/repository/products.dart';
import 'package:football_app/service_locator.dart';

class NewProductsUseCase implements UseCase<Either, dynamic> {
  @override
  Future<Either> call({dynamic params}) async {
    return await sl<ProductsReposiotry>().getNewProducts();
  }

}