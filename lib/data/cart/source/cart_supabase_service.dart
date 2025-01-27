import 'package:dartz/dartz.dart';
import 'package:football_app/data/cart/modelss/cart.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class CartSupabaseService {
  Future<Either> addToCart(CartModel cartModel);
  Future<Either> getCartProducts();
  Future<Either> getRemoveProducts(String id);
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
        'totalPrice': cartModel.totalPrice,
      });
      return const Right('Add to cart was successfully');
    } catch (e) {
      return const Left('Please try again');
    }
  }
  
  @override
  Future<Either> getCartProducts() async {
    try{
      var user = supabaseClient.auth.currentUser;
      if (user == null) {
        return const Left('User is not logged in');
      }
      var returnedData = await Supabase.instance.client
          .from('cart')
          .select('*')
          .eq('userId', user.id);

      List<Map> products = [];
      for (var item in returnedData) {
        item['id'] = item['id'];
        products.add(item);
      }
      return Right(products);
    } catch(e) {
      return const Left('Please try again');
    }
  }
  
  @override
  Future<Either> getRemoveProducts(String id) async {
    try {
      var user = Supabase.instance.client.auth.currentUser;
      if (user == null) {
        return const Left('User is not logged in');
      }
      await Supabase.instance.client
          .from('cart')
          .delete()
          .eq('id', id)
          .eq('userId', user.id);
      return const Right('Product deleted successfully');
    } catch (e) {
      return const Left('Please try again');
    }
  }
}
