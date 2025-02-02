import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:football_app/common/widgets/basic_appbar/basic_appbar.dart';
import 'package:football_app/core/assets/app_images.dart';
import 'package:football_app/presentation/cart/cart.dart';
import 'package:football_app/presentation/home/widget/brands.dart';
import 'package:football_app/presentation/home/widget/club_collections.dart';
import 'package:football_app/presentation/home/widget/new_product.dart';

class HomePage extends HookWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppbar(
        hideBack: true,
        title: Stack(
          children: [
            const Center(
              child: SizedBox(
                height: 100,
                child: Image(
                  image: AssetImage(AppImages.appLogo),
                ),
              ),
            ),
            Positioned(
              right: 20, 
              top: 30,
              child: IconButton(
                icon: const Icon(Icons.shopping_bag),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CartPage(),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 30),
            _rgolBanner(),
            const SizedBox(height: 30),
            const ClubCollections(),
            const SizedBox(height: 50),
            const Brands(),
            const SizedBox(height: 50),
            const NewProduct(),
          ],
        ),
      ),
    );
  }

  Widget _rgolBanner() {
    return Padding(
      padding: const EdgeInsets.only(right: 20, left: 20),
      child: Container(
        height: 200,
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(AppImages.rgolBanner),
          ),
        ),
      ),
    );
  }
}
