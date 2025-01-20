import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:football_app/bloc/button/button_cubit.dart';
import 'package:football_app/bloc/button/button_state.dart';
import 'package:football_app/common/widgets/basic_appbar/basic_appbar.dart';
import 'package:football_app/common/widgets/basic_reactive_button/basic_reactive_button.dart';
import 'package:football_app/domain/usecases/reset_password.dart';
import 'package:football_app/presentation/auth/we_send_email.dart';

class ForgotPasswordPage extends HookWidget {
  final emailController = TextEditingController();
  ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    final emailError = useState<String?>(null);

    return Scaffold(
      appBar: const BasicAppbar(),
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
                      builder: (context) => const WeSendEmailPage(),
                    ),
                  );
                }
              },
              child: Column(
                children: [
                  _resetPasswordText(),
                  const SizedBox(height: 50),
                  _emailField(emailError),
                  const SizedBox(height: 50),
                  _sendEmailButton(context, emailError),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _resetPasswordText() {
    return const Text(
      'Reset Password',
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

  Widget _sendEmailButton(
      BuildContext context, ValueNotifier<String?> emailError) {
    return Builder(
      builder: (context) {
        return BasicReactiveButton(
          onPressed: () {
            bool isEmailValid =
                _validateEmail(emailController.text, emailError);
            if (!isEmailValid) {
              return;
            }
            context.read<ButtonCubit>().execute(
                  usecase: ResetPasswordUseCase(),
                  params: emailController.text,
                );
          },
          title: 'Send Email',
        );
      },
    );
  }
}

bool _validateEmail(String email, ValueNotifier<String?> emailError) {
  if (email.isEmpty) {
    emailError.value = 'Email cannot be empty';
    return false;
  }
  emailError.value = null;
  return true;
}
