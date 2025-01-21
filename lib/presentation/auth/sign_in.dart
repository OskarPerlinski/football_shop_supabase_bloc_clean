import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:football_app/bloc/button/button_cubit.dart';
import 'package:football_app/bloc/button/button_state.dart';
import 'package:football_app/common/widgets/basic_appbar/basic_appbar.dart';
import 'package:football_app/common/widgets/basic_reactive_button/basic_reactive_button.dart';
import 'package:football_app/data/auth/models/user_signin_req.dart';
import 'package:football_app/domain/auth/usecases/sign_in.dart';
import 'package:football_app/presentation/auth/forgot_password.dart';
import 'package:football_app/presentation/auth/sign_up.dart';
import 'package:football_app/presentation/home/home.dart';

class SignInPage extends HookWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    final passwordVisible = useState(true);
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomePage(),
                    ),
                  );
                }
              },
              child: Column(
                children: [
                  _signInText(),
                  const SizedBox(height: 50),
                  _emailField(emailError),
                  const SizedBox(height: 20),
                  _passwordField(passwordVisible, passwordError),
                  const SizedBox(height: 50),
                  _signInButton(context, emailError, passwordError),
                  const SizedBox(height: 10),
                  _forgotPassword(context),
                  const SizedBox(height: 100),
                  _signUp(context),
                ],
              ),
            ),
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

  Widget _signInButton(BuildContext context, ValueNotifier<String?> emailError,
      ValueNotifier<String?> passwordError) {
    return Builder(
      builder: (context) {
        return BasicReactiveButton(
          onPressed: () {
            bool isEmailValid =
                _validateEmail(emailController.text, emailError);
            bool isPasswordValid =
                _validatePassword(passwordController.text, passwordError);
            if (!isEmailValid || !isPasswordValid) {
              return;
            }
            context.read<ButtonCubit>().execute(
                  usecase: SignInUseCase(),
                  params: UserSigninReqModels(
                    email: emailController.text,
                    password: passwordController.text,
                  ),
                );
          },
          title: 'Sign In',
        );
      },
    );
  }

  Widget _forgotPassword(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ForgotPasswordPage(),
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

  bool _validateEmail(String email, ValueNotifier<String?> emailError) {
    if (email.isEmpty) {
      emailError.value = 'Email cannot be empty';
      return false;
    }
    emailError.value = null;
    return true;
  }

  bool _validatePassword(
      String password, ValueNotifier<String?> passwordError) {
    if (password.isEmpty) {
      passwordError.value = 'Password cannot be empty';
      return false;
    }
    passwordError.value = null;
    return true;
  }
}
