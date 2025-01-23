import 'package:dartz/dartz.dart';
import 'package:football_app/core/usecases/usecases.dart';
import 'package:football_app/domain/products/repository/products.dart';
import 'package:football_app/service_locator.dart';

class GetByBrandIdUseCase implements UseCase<Either, String> {
  @override
  Future<Either> call({String? params}) async {
    return await sl<ProductsReposiotry>().getByBrandId(params!);
  }
}
