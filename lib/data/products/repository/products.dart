import 'package:dartz/dartz.dart';
import 'package:football_app/data/products/models/products.dart';
import 'package:football_app/data/products/source/products_supabase_service.dart';
import 'package:football_app/domain/products/repository/products.dart';
import 'package:football_app/service_locator.dart';

class ProductsRepositoryImpl extends ProductsReposiotry {
  @override
  Future<Either> getNewProducts() async {
    var returnedData = await sl<ProductsSupabaseService>().getNewProducts();
    return returnedData.fold(
      (error) {
        return Left(error);
      },
      (data) {
        return Right(List.from(data)
            .map((e) => ProductsModel.fromMap(e).toEntity())
            .toList());
      },
    );
  }

  @override
  Future<Either> getByBrandId(String brand) async {
    var returnedData = await sl<ProductsSupabaseService>().getByBrandId(brand);
    return returnedData.fold(
      (error) {
        return Left(error);
      },
      (data) {
        return Right(List.from(data)
            .map((e) => ProductsModel.fromMap(e).toEntity())
            .toList());
      },
    );
  }

  @override
  Future<Either> getByColletions(String collections) async {
    var returnedData =
        await sl<ProductsSupabaseService>().getByColletions(collections);
    return returnedData.fold(
      (error) {
        return Left(error);
      },
      (data) {
        return Right(List.from(data)
            .map((e) => ProductsModel.fromMap(e).toEntity())
            .toList());
      },
    );
  }
}
