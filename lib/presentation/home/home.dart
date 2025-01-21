import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:football_app/common/widgets/basic_appbar/basic_appbar.dart';
import 'package:football_app/core/assets/app_images.dart';
import 'package:football_app/presentation/home/widget/club_collections.dart';

class HomePage extends HookWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppbar(
        hideBack: true,
        title: SizedBox(
          height: 100,
          child: Image(
            image: AssetImage(AppImages.appLogo),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 30),
            _rgolBanner(),
            const SizedBox(height: 30),
            const ClubCollections(),
          ],
        ),
      ),
    );
  }

  Widget _rgolBanner() {
    return  Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Container(
          height: 200,
          decoration: const BoxDecoration(
            color: Colors.blue,
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(AppImages.rgolBanner),
            ),
          ),
        ),
    );
  }
}
