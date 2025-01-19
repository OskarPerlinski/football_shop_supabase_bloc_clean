import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football_app/bloc/splash/splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(DisplaySplash());

  void appStated() async {
    await Future.delayed(const Duration(seconds: 3));
    emit(UnAuthenticated());
  }
}