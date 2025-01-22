import 'package:dartz/dartz.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class BrandsSupabaseSource {
  Future<Either> getBrands();
}

class BrandsSupabaseSourceImpl extends BrandsSupabaseSource {
  final SupabaseClient supabaseClient;
  BrandsSupabaseSourceImpl({required this.supabaseClient});

  @override
  Future<Either> getBrands() async {
    try {
      var returnedData = await supabaseClient.from('brands').select();
      return Right(returnedData);
    } catch (e) {
      return const Left('Please try again');
    }
  }
}
