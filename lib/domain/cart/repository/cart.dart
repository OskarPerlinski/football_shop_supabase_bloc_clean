import 'package:dartz/dartz.dart';
import 'package:football_app/data/cart/modelss/cart.dart';

abstract class CartReposiotry{
  Future<Either> addToCart(CartModel cartModel);
}