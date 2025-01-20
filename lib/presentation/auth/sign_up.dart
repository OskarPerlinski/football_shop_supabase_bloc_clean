// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:football_app/bloc/button/button_cubit.dart';
import 'package:football_app/bloc/button/button_state.dart';
import 'package:football_app/common/widgets/basic_appbar/basic_appbar.dart';
import 'package:football_app/common/widgets/basic_reactive_button/basic_reactive_button.dart';
import 'package:football_app/data/auth/models/user_creation_req.dart';
import 'package:football_app/domain/usecases/sign_up.dart';
import 'package:football_app/presentation/auth/sign_in.dart';

class SignUpPage extends HookWidget {
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    final passwordVisible = useState(true);
    final firstNameError = useState<String?>(null);
    final lastNameError = useState<String?>(null);
    final emailError = useState<String?>(null);
    final passwordError = useState<String?>(null);

    return Scaffold(
      appBar: const BasicAppbar(hideBack: true),
      body: Padding(
        padding: const EdgeInsets.only(top: 10, left: 30, right: 30),
        child: SingleChildScrollView(
          child: BlocProvider(
            create: (context) => ButtonCubit(),
            child: BlocListener<ButtonCubit, ButtonState>(
              listener: (context, state) {
                if (state is ButtonLoadedState) {
                  var snackbar = const SnackBar(
                    content: Text('Sign up successful!'),
                    behavior: SnackBarBehavior.floating,
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackbar);
                  Future.delayed(
                    const Duration(seconds: 1),
                    () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SignInPage(),
                        ),
                      );
                    },
                  );
                }
              },
              child: Column(
                children: [
                  _signUpText(),
                  const SizedBox(height: 50),
                  _firstNameField(firstNameError),
                  const SizedBox(height: 20),
                  _lastNameField(lastNameError),
                  const SizedBox(height: 20),
                  _emailField(emailError),
                  const SizedBox(height: 20),
                  _passwordField(passwordVisible, passwordError),
                  const SizedBox(height: 50),
                  _signUpButton(context, firstNameError, lastNameError,
                      emailError, passwordError),
                  const SizedBox(height: 50),
                  _signIn(context),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _signUpText() {
    return const Text(
      'SIGN UP',
      style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
    );
  }

  Widget _firstNameField(ValueNotifier<String?> firstNameError) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'First Name',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        TextField(
          controller: firstNameController,
          decoration: InputDecoration(
            fillColor: Colors.white,
            filled: true,
            errorText: firstNameError.value,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
      ],
    );
  }

  Widget _lastNameField(ValueNotifier<String?> lastNameError) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Last Name',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        TextField(
          controller: lastNameController,
          decoration: InputDecoration(
            fillColor: Colors.white,
            filled: true,
            errorText: lastNameError.value,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
      ],
    );
  }

  Widget _emailField(ValueNotifier<String?> emailError) {
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
          controller: emailController,
          decoration: InputDecoration(
            fillColor: Colors.white,
            filled: true,
            errorText: emailError.value,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
      ],
    );
  }

  Widget _passwordField(ValueNotifier<bool> passwordVisible,
      ValueNotifier<String?> passwordError) {
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
          obscureText: true,
          controller: passwordController,
          decoration: InputDecoration(
            fillColor: Colors.white,
            filled: true,
            errorText: passwordError.value,
            suffixIcon: IconButton(
              onPressed: () {
                passwordVisible.value = !passwordVisible.value;
              },
              icon: Icon(
                passwordVisible.value ? Icons.visibility_off : Icons.visibility,
              ),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
      ],
    );
  }

  Widget _signUpButton(
      BuildContext context,
      ValueNotifier<String?> firstNameError,
      ValueNotifier<String?> lastNameError,
      ValueNotifier<String?> emailError,
      ValueNotifier<String?> passwordError) {
    return Builder(
      builder: (context) {
        return BasicReactiveButton(
          onPressed: () {
            if (!_validateFields(
              firstNameError,
              lastNameError,
              emailError,
              passwordError,
            )) {
              return;
            }
            context.read<ButtonCubit>().execute(
                  usecase: SignUpUseCase(),
                  params: UserCreationReqModels(
                    firstName: firstNameController.text,
                    lastName: lastNameController.text,
                    email: emailController.text,
                    password: passwordController.text,
                  ),
                );
          },
          title: 'Sign Up',
        );
      },
    );
  }

  Widget _signIn(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Already have an account?',
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
                builder: (context) => const SignInPage(),
              ),
            );
          },
          child: const Text(
            'Sign In',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }

  bool _validateFields(
    ValueNotifier<String?> firstNameError,
    ValueNotifier<String?> lastNameError,
    ValueNotifier<String?> emailError,
    ValueNotifier<String?> passwordError) {
  bool isValid = true;

  if (firstNameController.text.isEmpty) {
    firstNameError.value = "First Name cannot be empty";
    isValid = false;
  } else {
    firstNameError.value = null;
  }

  if (lastNameController.text.isEmpty) {
    lastNameError.value = "Last Name cannot be empty";
    isValid = false;
  } else {
    lastNameError.value = null;
  }

  if (emailController.text.isEmpty) {
    emailError.value = "Email cannot be empty";
    isValid = false;
  } else {
    emailError.value = null;
  }

  if (passwordController.text.isEmpty) {
    passwordError.value = "Password cannot be empty";
    isValid = false;
  } else if (passwordController.text.length < 6) {
    passwordError.value = "Password must be at least 6 characters long";
    isValid = false;
  } else {
    passwordError.value = null;
  }

  return isValid;
}
}
