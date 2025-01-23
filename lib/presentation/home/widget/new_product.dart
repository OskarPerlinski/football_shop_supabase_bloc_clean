import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:football_app/bloc/products/products_cubit.dart';
import 'package:football_app/bloc/products/products_state.dart';
import 'package:football_app/common/widgets/product_card/product_card.dart';
import 'package:football_app/domain/products/entity/products.dart';
import 'package:football_app/domain/products/usecases/new_products.dart';
import 'package:football_app/service_locator.dart';

class NewProduct extends HookWidget {
  const NewProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ProductsCubit(useCase: sl<NewProductsUseCase>())..displayProducts(),
      child: BlocBuilder<ProductsCubit, ProductsState>(
        builder: (context, state) {
          if (state is ProductsLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is ProductsLoaded) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _newText(),
                const SizedBox(height: 20),
                _newProducts(state.products),
              ],
            );
          }
          if (state is FailureLoadProducts) {
            return const Text('Please try again...');
          }
          return Container();
        },
      ),
    );
  }

  Widget _newText() {
    return const Padding(
      padding: EdgeInsets.only(left: 20),
      child: Text(
        'New',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 25,
        ),
      ),
    );
  }

  Widget _newProducts(List<ProductsEntity> products) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: SizedBox(
        height: 300,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return ProductCard(productsEntity: products[index]);
          },
          separatorBuilder: (context, index) => const SizedBox(width: 10),
          itemCount: 4,
        ),
      ),
    );
  }
}
