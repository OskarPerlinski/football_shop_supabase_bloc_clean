import 'package:dartz/dartz.dart';
import 'package:football_app/core/usecases/usecases.dart';
import 'package:football_app/data/auth/models/user_signin_req.dart';
import 'package:football_app/domain/repository/auth.dart';
import 'package:football_app/service_locator.dart';

class SignInUseCase implements UseCase<Either, UserSigninReqModels> {
  @override
  Future<Either> call({UserSigninReqModels? params}) async {
    return await sl<AuthRepository>().getSignIn(params!);
  }
}
