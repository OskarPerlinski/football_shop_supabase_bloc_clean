import 'package:football_app/data/auth/repository/auth.dart';
import 'package:football_app/data/auth/source/auth_supabase_service.dart';
import 'package:football_app/domain/repository/auth.dart';
import 'package:football_app/domain/usecases/reset_password.dart';
import 'package:football_app/domain/usecases/sign_in.dart';
import 'package:football_app/domain/usecases/sign_up.dart';
import 'package:get_it/get_it.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final sl = GetIt.instance;

Future<void> initialzeDependencies() async {
  //services
  sl.registerSingleton<AuthSupabaseService>(AuthSupabaseServiceImpl(supabaseClient: Supabase.instance.client));
  //repository
  sl.registerSingleton<AuthRepository>(AuthRepositoryImpl());
  //usecases
  sl.registerSingleton<SignUpUseCase>(SignUpUseCase());
  sl.registerSingleton<SignInUseCase>(SignInUseCase());
  sl.registerSingleton<ResetPasswordUseCase>(ResetPasswordUseCase());
}