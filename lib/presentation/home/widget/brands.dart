import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:football_app/bloc/brands/brands_cubit.dart';
import 'package:football_app/bloc/brands/brands_state.dart';
import 'package:football_app/domain/brands/entity/brands.dart';

class Brands extends HookWidget {
  const Brands({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BrandsCubit()..displayBrands(),
      child: BlocBuilder<BrandsCubit, BrandsState>(
        builder: (context, state) {
          if (state is BrandsLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is BrandsLoaded) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _brandsText(),
                const SizedBox(height: 30),
                _brands(state.brands),
              ],
            );
          }
          if (state is FailureLoadedBrands) {
            return const Text(
              'Failed to load...',
            );
          }
          return Container();
        },
      ),
    );
  }

  Widget _brandsText() {
    return const Padding(
      padding: EdgeInsets.only(left: 20),
      child: Text(
        'Brands',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 25,
        ),
      ),
    );
  }

  Widget _brands(List<BrandsEntity> brands) {
    return SizedBox(
      height: 550,
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 1,
          mainAxisSpacing: 1,
          childAspectRatio: 0.8,
        ),
        itemCount: brands.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 200,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: NetworkImage(brands[index].image),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Center(
                  child: Text(
                    brands[index].brand,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
