import 'package:dartz/dartz.dart';
import 'package:football_app/data/cart/modelss/cart.dart';
import 'package:football_app/data/cart/modelss/product_ordered.dart';
import 'package:football_app/data/cart/source/cart_supabase_service.dart';
import 'package:football_app/domain/cart/repository/cart.dart';
import 'package:football_app/service_locator.dart';

class CartReposiotryImpl extends CartReposiotry {
  @override
  Future<Either> addToCart(CartModel cartModel) async {
    return await sl<CartSupabaseService>().addToCart(cartModel);
  }

  @override
  Future<Either> getCartProducts() async {
    var returnedData = await sl<CartSupabaseService>().getCartProducts();
    return returnedData.fold(
      (error) {
        return left(error);
      },
      (data) {
        return Right(
          List.from(data)
              .map((e) => ProductOrderedModel.fromMap(e).toEntity())
              .toList(),
        );
      },
    );
  }
  
  @override
  Future<Either> getRemoveProducts(String id) async {
    var returnedData = await sl<CartSupabaseService>().getRemoveProducts(id);
    return returnedData.fold(
      (error) {
        return Left(error);
      },
      (message) {
        return Right(message);
      },
    );
  }
}
