import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:football_app/common/widgets/basic_appbar/basic_appbar.dart';
import 'package:football_app/common/widgets/basic_button/basic_button.dart';
import 'package:football_app/core/assets/app_images.dart';
import 'package:football_app/domain/products/entity/products.dart';

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
              _quantity(),
              const SizedBox(height: 20),
              _productDescription(),
              const SizedBox(height: 30),
              _addToCartButton(),
              const SizedBox(height: 30),
            ],
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
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: productsEntity.size.length,
            separatorBuilder: (context, index) => const SizedBox(width: 10),
            itemBuilder: (context, index) {
              return Container(
                width: 40,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.black),
                ),
                child: Center(
                  child: Text(
                    productsEntity.size[index],
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _quantity() {
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
              onPressed: () {},
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
            const Text(
              '0',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(width: 20),
            IconButton(
              onPressed: () {},
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

  Widget _addToCartButton() {
    return BasicAppButton(
      onPressed: () {},
      title: 'BUY NOW',
    );
  }
}
