import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:football_app/bloc/button/button_cubit.dart';
import 'package:football_app/bloc/button/button_state.dart';
import 'package:football_app/bloc/product_size/product_size.dart';
import 'package:football_app/bloc/quantity/quantity_cubit.dart';
import 'package:football_app/common/widgets/basic_appbar/basic_appbar.dart';
import 'package:football_app/common/widgets/basic_reactive_button/basic_reactive_button.dart';
import 'package:football_app/core/assets/app_images.dart';
import 'package:football_app/data/cart/modelss/cart.dart';
import 'package:football_app/domain/cart/usecases/add_to_cart.dart';
import 'package:football_app/domain/products/entity/products.dart';
import 'package:football_app/presentation/cart/cart.dart';

class DetailPage extends HookWidget {
  final ProductsEntity productsEntity;
  const DetailPage({super.key, required this.productsEntity});

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
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: SingleChildScrollView(
          child: BlocProvider(
            create: (context) => ButtonCubit(),
            child: BlocListener<ButtonCubit, ButtonState>(
              listener: (context, state) {
                if (state is ButtonLoadedState) {
                  {
                    var snackbar = const SnackBar(
                      content: Text('Product added to cart'),
                      behavior: SnackBarBehavior.floating,
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackbar);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CartPage(),
                      ),
                    );
                  }
                }
                if (state is ButtonFailureState) {
                  const Text('Please try again...');
                }
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _imagesProduct(),
                  const SizedBox(height: 20),
                  _nameProduct(),
                  const SizedBox(height: 20),
                  _priceAndRaiting(),
                  const SizedBox(height: 20),
                  _sizes(),
                  const SizedBox(height: 20),
                  _quantity(context),
                  const SizedBox(height: 20),
                  _productDescription(),
                  const SizedBox(height: 30),
                  _addToCartButton(context),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _imagesProduct() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: 300,
          width: 180,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                productsEntity.images[0],
              ),
            ),
          ),
        ),
        const SizedBox(width: 10),
        Container(
          height: 300,
          width: 180,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                productsEntity.images[1],
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget _nameProduct() {
    return Text(
      productsEntity.name,
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 25,
      ),
    );
  }

  Widget _priceAndRaiting() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "${productsEntity.price}\$",
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 20,
            color: Colors.blue,
          ),
        ),
        Row(
          children: [
            Text(
              productsEntity.raiting,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 20,
                color: Colors.blue,
              ),
            ),
            const SizedBox(width: 5),
            const Icon(
              Icons.star,
              color: Colors.orange,
            ),
          ],
        ),
      ],
    );
  }

  Widget _sizes() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Sizes:',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        const SizedBox(height: 30),
        SizedBox(
          height: 40,
          child: BlocBuilder<ProductSizeCubit, int>(
            builder: (context, selectedIndex) {
              return ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: productsEntity.size.length,
                separatorBuilder: (context, index) => const SizedBox(width: 10),
                itemBuilder: (context, index) {
                  final isSelected = selectedIndex == index;
                  return GestureDetector(
                    onTap: () {
                      context.read<ProductSizeCubit>().itemSelection(index);
                    },
                    child: Container(
                      width: 40,
                      decoration: BoxDecoration(
                        color: isSelected ? Colors.white : Colors.blue,
                        border: Border.all(color: Colors.black),
                      ),
                      child: Center(
                        child: Text(
                          productsEntity.size[index],
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: isSelected ? Colors.black : Colors.white,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _quantity(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Quantity: ',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () {
                context.read<QuantityCubit>().decrement();
              },
              icon: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.red,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      spreadRadius: 2,
                      blurRadius: 5,
                    )
                  ],
                ),
                child: const Center(
                  child: Icon(
                    Icons.remove,
                    size: 30,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 20),
            BlocBuilder<QuantityCubit, int>(
              builder: (context, state) => Text(
                state.toString(),
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            const SizedBox(width: 20),
            IconButton(
              onPressed: () {
                context.read<QuantityCubit>().increment();
              },
              icon: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.green,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      spreadRadius: 2,
                      blurRadius: 5,
                    )
                  ],
                ),
                child: const Center(
                  child: Icon(
                    Icons.add,
                    size: 30,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }

  Widget _productDescription() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Product Description',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        const SizedBox(height: 20),
        Text(
          productsEntity.description,
        ),
      ],
    );
  }

  Widget _addToCartButton(BuildContext context) {
    return Builder(
      builder: (context) {
        return BasicReactiveButton(
          onPressed: () {
            context.read<ButtonCubit>().execute(
                  usecase: AddToCartUseCase(),
                  params: CartModel(
                    createdAt: DateTime.now().toString(),
                    productId: productsEntity.id,
                    name: productsEntity.name,
                    price: productsEntity.price,
                    imgaes: productsEntity.images[0],
                    quantity: context.read<QuantityCubit>().state.toString(),
                    size: productsEntity
                        .size[context.read<ProductSizeCubit>().selectedIndex],
                  ),
                );
          },
          title: 'BUY NOW',
        );
      }
    );
  }
}
