// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:football_app/domain/club_collections/entity/club_collections.dart';

class ClubCollectionsModel {
  final String id;
  final String league;
  final String image;

  ClubCollectionsModel(
      {required this.id, required this.league, required this.image});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'league': league,
      'image': image,
    };
  }

  factory ClubCollectionsModel.fromMap(Map<String, dynamic> map) {
    return ClubCollectionsModel(
      id: map['id'] as String,
      league: map['league'] as String,
      image: map['image'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ClubCollectionsModel.fromJson(String source) =>
      ClubCollectionsModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

extension ClubCollectionsXModel on ClubCollectionsModel {
  ClubCollectionsEntity toEntity() {
    return ClubCollectionsEntity(
      id: id,
      league: league,
      image: image,
    );
  }
}
