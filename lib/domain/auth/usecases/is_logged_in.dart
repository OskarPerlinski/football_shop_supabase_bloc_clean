import 'package:football_app/core/usecases/usecases.dart';
import 'package:football_app/domain/auth/repository/auth.dart';
import 'package:football_app/service_locator.dart';

class IsLoggedInUseCase implements UseCase<bool, dynamic> {
  @override
  Future<bool> call({dynamic params}) async {
    return await sl<AuthRepository>().isLoggedIn();
  }

}