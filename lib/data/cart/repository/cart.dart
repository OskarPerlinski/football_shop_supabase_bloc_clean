import 'package:dartz/dartz.dart';
import 'package:football_app/data/cart/modelss/cart.dart';
import 'package:football_app/data/cart/source/cart_supabase_service.dart';
import 'package:football_app/domain/cart/repository/cart.dart';
import 'package:football_app/service_locator.dart';

class CartReposiotryImpl extends CartReposiotry{
  @override
  Future<Either> addToCart(CartModel cartModel) async {
    return await sl<CartSupabaseService>().addToCart(cartModel);
  }

}