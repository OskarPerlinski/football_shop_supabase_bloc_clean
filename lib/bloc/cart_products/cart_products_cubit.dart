import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football_app/bloc/cart_products/cart_products_state.dart';
import 'package:football_app/domain/cart/entity/product_ordered.dart';
import 'package:football_app/domain/cart/usecases/get_cart_products.dart';
import 'package:football_app/domain/cart/usecases/get_remove_products.dart';
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

  void removeProducts(ProductOrderedEntity product) async {
    var returnedData =
        await sl<GetRemoveProductsUseCase>().call(params: product.id);
    returnedData.fold(
      (error) {
        emit(FailureLoadCartProducts());
      },
      (data) {
        displayProducts();
      },
    );
  }
}
