import 'package:dartz/dartz.dart';
import 'package:football_app/data/auth/models/user_creation_req.dart';
import 'package:football_app/data/auth/source/auth_supabase_service.dart';
import 'package:football_app/domain/repository/auth.dart';
import 'package:football_app/service_locator.dart';

class AuthRepositoryImpl extends AuthRepository{
  @override
  Future<Either> getSignUp(UserCreationReqModels user) async {
   return await sl<AuthSupabaseService>().getSignUp(user);
  }

}