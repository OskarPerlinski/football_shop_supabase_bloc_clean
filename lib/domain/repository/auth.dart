import 'package:dartz/dartz.dart';
import 'package:football_app/data/auth/models/user_creation_req.dart';

abstract class AuthRepository{
Future<Either> getSignUp(UserCreationReqModels user);
}