import 'package:dartz/dartz.dart';
import 'package:football_app/core/usecases/usecases.dart';
import 'package:football_app/data/cart/modelss/cart.dart';
import 'package:football_app/domain/cart/repository/cart.dart';
import 'package:football_app/service_locator.dart';

class AddToCartUseCase implements UseCase<Either, CartModel> {
  @override
  Future<Either> call({CartModel ? params}) async {
    return await sl<CartReposiotry>().addToCart(params!);
  }

}