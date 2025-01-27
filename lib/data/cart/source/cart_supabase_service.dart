import 'package:dartz/dartz.dart';
import 'package:football_app/data/cart/modelss/cart.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class CartSupabaseService {
  Future<Either> addToCart(CartModel cartModel);
}

class CartSupabaseServiceImpl extends CartSupabaseService {
  final SupabaseClient supabaseClient;
  CartSupabaseServiceImpl({required this.supabaseClient});

  @override
  Future<Either> addToCart(CartModel cartModel) async {
    try {
      var user = supabaseClient.auth.currentUser;
      if (user == null) {
        return const Left('User is not logged in');
      }

      await supabaseClient.from('cart').insert({
        'userId': user.id,
        'createdAt': cartModel.createdAt,
        'productId': cartModel.productId,
        'name': cartModel.name,
        'price': cartModel.price,
        'images': cartModel.imgaes,
        'size': cartModel.size,
        'quantity': cartModel.quantity,
      });
      return const Right('Add to cart was successfully');
    } catch (e) {
      return const Left('Please try again');
    }
  }
}
