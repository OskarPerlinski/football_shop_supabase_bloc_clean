import 'package:dartz/dartz.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class ClubCollectionsSupabaseSource {
  Future<Either> getClubCollections();
}

class ClubCollectionsSupabaseSourceImpl extends ClubCollectionsSupabaseSource {
  final SupabaseClient supabaseClient;
  ClubCollectionsSupabaseSourceImpl({required this.supabaseClient});

  @override
  Future<Either> getClubCollections() async {
    try {
      var returnedData = await supabaseClient.from('clubCollections').select();
      return Right(returnedData);
    } catch (e) {
      return const Left('Please try again');
    }
  }
}
