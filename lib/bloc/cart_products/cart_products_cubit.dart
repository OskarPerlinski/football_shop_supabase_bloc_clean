import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football_app/bloc/cart_products/cart_products_state.dart';
import 'package:football_app/domain/cart/usecases/get_cart_products.dart';
import 'package:football_app/service_locator.dart';

class CartProductsCubit extends Cubit<CartProductsState> {
  CartProductsCubit() : super(CartProductsLoading());

  void displayProducts() async {
    var returnedData = await sl<GetCartProductsUseCase>().call();
    returnedData.fold(
      (error) {
        emit(FailureLoadCartProducts());
      },
      (data) {
        emit(CartProductsLoaded(products: data));
      },
    );
  }
}
