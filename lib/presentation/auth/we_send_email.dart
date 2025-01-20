import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:football_app/common/widgets/basic_button/basic_button.dart';
import 'package:football_app/core/assets/app_images.dart';
import 'package:football_app/presentation/auth/sign_in.dart';

class WeSendEmailPage extends HookWidget {
  const WeSendEmailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _weSendEmail(),
          const SizedBox(height: 50),
          _imageEmail(),
          const SizedBox(height: 50),
          _backToLoginButton(context),
        ],
      ),
    );
  }

  Widget _weSendEmail() {
    return const Center(
      child: Text(
        'We Send You Email',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 25,
        ),
      ),
    );
  }

  Widget _imageEmail() {
    return Image.asset(
      AppImages.emailSend,
      height: 100,
      width: 100,
    );
  }

  Widget _backToLoginButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30),
      child: BasicAppButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SignInPage(),
            ),
          );
        },
        title: 'Login',
      ),
    );
  }
}
