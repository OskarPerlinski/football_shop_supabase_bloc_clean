import 'package:dartz/dartz.dart';
import 'package:football_app/data/auth/models/user_creation_req.dart';
import 'package:football_app/data/auth/models/user_signin_req.dart';

abstract class AuthRepository{
Future<Either> getSignUp(UserCreationReqModels user);
Future<Either> getSignIn(UserSigninReqModels user);
}