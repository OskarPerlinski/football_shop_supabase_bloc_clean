import 'package:football_app/domain/club_collections/entity/club_collections.dart';

abstract class ClubCollectionsState {}

class ClubCollectionsInitial extends ClubCollectionsState{}

class ClubCollectionsLoading extends ClubCollectionsState{}

class ClubCollectionsLoaded extends ClubCollectionsState{
  final List<ClubCollectionsEntity> collections;
  ClubCollectionsLoaded({required this.collections});
}

class FailureLoadClubCollections extends ClubCollectionsState{}