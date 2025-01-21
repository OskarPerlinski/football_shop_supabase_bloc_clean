import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football_app/bloc/splash/splash_state.dart';
import 'package:football_app/domain/auth/usecases/is_logged_in.dart';
import 'package:football_app/service_locator.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(DisplaySplash());

  void appStated() async {
    await Future.delayed(const Duration(seconds: 3));
    var isLoggedIn = await sl<IsLoggedInUseCase>().call();
    if (isLoggedIn) {
      emit(Authenticated());
    } else {
      emit(UnAuthenticated());
    }
  }
}
