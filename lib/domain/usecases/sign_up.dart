import 'package:dartz/dartz.dart';
import 'package:football_app/core/usecases/usecases.dart';
import 'package:football_app/data/auth/models/user_creation_req.dart';
import 'package:football_app/domain/repository/auth.dart';
import 'package:football_app/service_locator.dart';

class SignUpUseCase implements UseCase<Either, UserCreationReqModels> {
  @override
  Future<Either> call({UserCreationReqModels? params}) async {
    return await sl<AuthRepository>().getSignUp(params!);
  }
  
}