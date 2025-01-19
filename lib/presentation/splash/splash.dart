import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:football_app/core/assets/app_images.dart';

class SplashPage extends HookWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _appLogo(),
          ],
        ),
      ),
    );
  }

  Widget _appLogo() {
    return Image.asset(
      AppImages.appLogo,
    );
  }
}