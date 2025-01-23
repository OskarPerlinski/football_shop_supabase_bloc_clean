import 'package:dartz/dartz.dart';
import 'package:flutter/widgets.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class ProductsSupabaseService {
  Future<Either> getNewProducts();
}

class ProductsSupabaseServiceImpl extends ProductsSupabaseService {
  final SupabaseClient supabaseClient;
  ProductsSupabaseServiceImpl({required this.supabaseClient});

  @override
  Future<Either> getNewProducts() async {
    try {
      var returnedData = await supabaseClient
          .from('products')
          .select()
          .order('createdAt', ascending: false);
      return Right(returnedData);
    } catch (e) {
      return const Left(
        Text('Please try again'),
      );
    }
  }
}
