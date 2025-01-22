import 'package:football_app/domain/brands/entity/brands.dart';

abstract class BrandsState {}

class BrandsLoading extends BrandsState{}

class BrandsLoaded extends BrandsState{
  final List<BrandsEntity> brands;
  BrandsLoaded({required this.brands});
}

class FailureLoadedBrands extends BrandsState{}

