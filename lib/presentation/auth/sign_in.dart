import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:football_app/common/widgets/basic_appbar/basic_appbar.dart';
import 'package:football_app/common/widgets/basic_button/basic_button.dart';
import 'package:football_app/presentation/auth/forgot_password.dart';
import 'package:football_app/presentation/auth/sign_up.dart';

class SignInPage extends HookWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppbar(hideBack: true),
      body: Padding(
        padding: const EdgeInsets.only(top: 10, left: 30, right: 30),
        child: SingleChildScrollView(
          child: Column(
            children: [
              _signInText(),
              const SizedBox(height: 50),
              _emailField(),
              const SizedBox(height: 20),
              _passwordField(),
              const SizedBox(height: 50),
              _signInButton(),
              const SizedBox(height: 10),
              _forgotPassword(context),
              const SizedBox(height: 100),
              _signUp(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _signInText() {
    return const Text(
      'SIGN IN',
      style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
    );
  }

  Widget _emailField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Email',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        TextField(
          decoration: InputDecoration(
            fillColor: Colors.white,
            filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
      ],
    );
  }

  Widget _passwordField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Password',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        TextField(
          decoration: InputDecoration(
            fillColor: Colors.white,
            filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
      ],
    );
  }

  Widget _signInButton() {
    return BasicAppButton(
      onPressed: () {},
      title: 'Sign In',
    );
  }

  Widget _forgotPassword(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const ForgotPasswordPage(),
          ),
        );
      },
      child: const Text(
        'Forgot Password?',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.blue,
        ),
      ),
    );
  }

  Widget _signUp(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Dont have an account?',
          style: TextStyle(
            color: Colors.black54,
          ),
        ),
        const SizedBox(width: 5),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SignUpPage(),
              ),
            );
          },
          child: const Text(
            'Sign Up',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
