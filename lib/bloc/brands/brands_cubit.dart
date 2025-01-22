import 'package:bloc/bloc.dart';
import 'package:football_app/bloc/brands/brands_state.dart';
import 'package:football_app/domain/brands/usecase/brands.dart';
import 'package:football_app/service_locator.dart';

class BrandsCubit extends Cubit<BrandsState> {
  BrandsCubit() : super(BrandsLoading());

  void displayBrands() async {
    var returnedData = await sl<BrandsUseCase>().call();
    returnedData.fold(
      (error) {
        emit(FailureLoadedBrands());
      },
      (data) {
        emit(BrandsLoaded(brands: data));
      },
    );
  }
}
