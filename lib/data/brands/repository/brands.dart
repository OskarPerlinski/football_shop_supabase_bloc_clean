import 'package:dartz/dartz.dart';
import 'package:football_app/data/brands/models/brands.dart';
import 'package:football_app/data/brands/source/brands_supabase_source.dart';
import 'package:football_app/domain/brands/repository/brands.dart';
import 'package:football_app/service_locator.dart';

class BrandsRepositoryImpl extends BrandsReposiotry {
  @override
  Future<Either> getBrands() async {
    var returnedData = await sl<BrandsSupabaseSource>().getBrands();
    return returnedData.fold(
      (error) {
        return Left(error);
      },
      (data) {
        return Right(List.from(data)
            .map((e) => BrandsModels.fromMap(e).toEntity())
            .toList());
      },
    );
  }
}
