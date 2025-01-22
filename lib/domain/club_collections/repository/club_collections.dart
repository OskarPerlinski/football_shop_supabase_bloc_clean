import 'package:dartz/dartz.dart';

abstract class ClubCollectionsRepository{
  Future<Either> getClubCollections();
}