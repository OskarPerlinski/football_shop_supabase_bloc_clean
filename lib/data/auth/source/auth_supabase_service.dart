import 'package:dartz/dartz.dart';
import 'package:football_app/data/auth/models/user_creation_req.dart';
import 'package:football_app/data/auth/models/user_signin_req.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class AuthSupabaseService {
  Future<Either> getSignUp(UserCreationReqModels user);
  Future<Either> getSignIn(UserSigninReqModels user);
  Future<Either> getResetPassword(String email);
}

class AuthSupabaseServiceImpl extends AuthSupabaseService {
  final SupabaseClient supabaseClient;
  AuthSupabaseServiceImpl({required this.supabaseClient});

  @override
  Future<Either> getSignUp(UserCreationReqModels user) async {
    try {
      final returnedData = await supabaseClient.auth.signUp(
        password: user.password!,
        email: user.email!,
        data: {
          'firstName': user.firstName,
          'lastName': user.lastName,
        },
      );
      return Right(returnedData.user!.id);
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either> getSignIn(UserSigninReqModels user) async {
    try {
      final returnedData = await supabaseClient.auth.signInWithPassword(
        password: user.password!,
        email: user.email!,
      );
      return Right(returnedData.user!.id);
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either> getResetPassword(String email) async {
    try {
      await supabaseClient.auth.resetPasswordForEmail(email);
      return const Right('Password reset Email is sent');
    } catch (e) {
      return const Left('Please try again');
    }
  }
}
