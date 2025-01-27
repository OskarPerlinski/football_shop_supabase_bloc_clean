import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:football_app/bloc/cart_products/cart_products_cubit.dart';
import 'package:football_app/bloc/cart_products/cart_products_state.dart';
import 'package:football_app/common/widgets/basic_appbar/basic_appbar.dart';
import 'package:football_app/domain/cart/entity/product_ordered.dart';
import 'package:football_app/presentation/cart/widgets/check_out.dart';
import 'package:football_app/presentation/cart/widgets/product_ordered_card.dart';

class CartPage extends HookWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppbar(
        title: Text('CART'),
      ),
      body: BlocProvider(
        create: (context) => CartProductsCubit()..displayProducts(),
        child: BlocBuilder<CartProductsCubit, CartProductsState>(
          builder: (context, state) {
            if (state is CartProductsLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is CartProductsLoaded) {
              return state.products.isEmpty
                  ? _emptyCart()
                  : Column(
                      children: [
                        Expanded(
                          child: _products(state.products),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: CheckOut(products: state.products),
                        )
                      ],
                    );
            }
            if (state is FailureLoadCartProducts) {
              return const Text('Please try again...');
            }
            return Container();
          },
        ),
      ),
    );
  }

  Widget _products(List<ProductOrderedEntity> products) {
    double padding = kIsWeb ? 120 : 20;
    return ListView.separated(
      padding: EdgeInsets.only(left: padding, right: padding),
      itemBuilder: (context, index) {
        return ProductOrderedCard(
          productOrderedEntity: products[index],
        );
      },
      separatorBuilder: (context, index) => const SizedBox(height: 10),
      itemCount: products.length,
    );
  }

  Widget _emptyCart() {
    return const Center(
      child: Text(
        'Cart is Empty :c',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
    );
  }
}
