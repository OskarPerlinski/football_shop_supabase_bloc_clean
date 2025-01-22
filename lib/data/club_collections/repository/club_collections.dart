import 'package:dartz/dartz.dart';
import 'package:football_app/data/club_collections/models/club_collections.dart';
import 'package:football_app/data/club_collections/source/club_collections_supabase_source.dart';
import 'package:football_app/domain/club_collections/repository/club_collections.dart';
import 'package:football_app/service_locator.dart';

class ClubCollectionsRepositoryImpl extends ClubCollectionsRepository {
  @override
  Future<Either> getClubCollections() async {
    var returnedData =
        await sl<ClubCollectionsSupabaseSource>().getClubCollections();
    return returnedData.fold(
      (error) {
        return Left(error);
      },
      (data) {
        return Right(List.from(data)
            .map((e) => ClubCollectionsModel.fromMap(e).toEntity())
            .toList());
      },
    );
  }
}
