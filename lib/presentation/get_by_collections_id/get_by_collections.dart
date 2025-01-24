import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:football_app/bloc/products/products_cubit.dart';
import 'package:football_app/bloc/products/products_state.dart';
import 'package:football_app/common/widgets/basic_appbar/basic_appbar.dart';
import 'package:football_app/common/widgets/product_card/product_card.dart';
import 'package:football_app/core/assets/app_images.dart';
import 'package:football_app/domain/club_collections/entity/club_collections.dart';
import 'package:football_app/domain/products/entity/products.dart';
import 'package:football_app/domain/products/usecases/get_by_collections.dart';
import 'package:football_app/service_locator.dart';

class GetByCollectionsPage extends HookWidget {
  final ClubCollectionsEntity collectionsEntity;
  const GetByCollectionsPage({super.key, required this.collectionsEntity});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppbar(
        title: SizedBox(
          height: 100,
          child: Image(
            image: AssetImage(AppImages.appLogo),
          ),
        ),
      ),
      body: BlocProvider(
        create: (context) =>
            ProductsCubit(useCase: sl<GetByCollectionsUseCase>())
              ..displayProducts(params: collectionsEntity.id),
        child: BlocBuilder<ProductsCubit, ProductsState>(
          builder: (context, state) {
            if (state is ProductsLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is ProductsLoaded) {
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Column(
                    children: [
                      _collections(state.products),
                      const SizedBox(height: 30),
                      _product(state.products),
                    ],
                  ),
                ),
              );
            }
            if (state is FailureLoadProducts) {
              return const Text('Please try again...');
            }
            return Container();
          },
        ),
      ),
    );
  }

  Widget _collections(List<ProductsEntity> products) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Text(
                collectionsEntity.league,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              const SizedBox(width: 10),
              Text(
                '(${products.length})',
                style: const TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _product(List<ProductsEntity> products) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: products.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 0.7,
        ),
        itemBuilder: (context, index) {
          return ProductCard(
            productsEntity: products[index],
          );
        },
      ),
    );
  }
}
