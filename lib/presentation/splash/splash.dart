import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:football_app/bloc/splash/splash_cubit.dart';
import 'package:football_app/bloc/splash/splash_state.dart';
import 'package:football_app/core/assets/app_images.dart';
import 'package:football_app/presentation/auth/sign_in.dart';

class SplashPage extends HookWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocListener<SplashCubit, SplashState>(
          listener: (context, state) {
            if (state is UnAuthenticated) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SignInPage(),
                ),
              );
            }
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _appLogo(),
            ],
          ),
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
