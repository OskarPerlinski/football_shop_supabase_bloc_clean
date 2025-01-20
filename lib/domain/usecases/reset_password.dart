import 'package:dartz/dartz.dart';
import 'package:football_app/core/usecases/usecases.dart';
import 'package:football_app/domain/repository/auth.dart';
import 'package:football_app/service_locator.dart';

class ResetPasswordUseCase implements UseCase<Either, String> {
  @override
  Future<Either> call({String ? params}) async {
    return await sl<AuthRepository>().getResetPassword(params!);
  }
  
}