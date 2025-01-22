import 'package:dartz/dartz.dart';
import 'package:football_app/core/usecases/usecases.dart';
import 'package:football_app/domain/club_collections/repository/club_collections.dart';
import 'package:football_app/service_locator.dart';

class ClubCollectionsUseCase implements UseCase<Either, dynamic> {
  @override
  Future<Either> call({dynamic params}) async {
    return await sl<ClubCollectionsRepository>().getClubCollections();
  }
}
