import 'package:dartz/dartz.dart';
import 'package:football_app/core/usecases/usecases.dart';
import 'package:football_app/domain/cart/repository/cart.dart';
import 'package:football_app/service_locator.dart';

class GetRemoveProductsUseCase implements UseCase<Either, String> {
  @override
  Future<Either> call({String?  params}) async {
    return sl<CartReposiotry>().getRemoveProducts(params!);
  }

}