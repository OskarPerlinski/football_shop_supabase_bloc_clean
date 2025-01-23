import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football_app/bloc/products/products_state.dart';
import 'package:football_app/core/usecases/usecases.dart';

class ProductsCubit extends Cubit<ProductsState> {
  final UseCase useCase;
  ProductsCubit({required this.useCase}) : super(ProductsInitialState());

  void displayProducts({dynamic params}) async {
    emit(ProductsLoading());
    var returnedData = await useCase.call(params: params);
    returnedData.fold(
      (error) {
        emit(
          FailureLoadProducts(),
        );
      },
      (data) {
        emit(
          ProductsLoaded(products: data),
        );
      },
    );
  }
}
