import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../core/errors/Failures.dart';
import '../../../core/usecases/UseCases.dart';
import '../entities/ApiSuccess.dart';
import '../repositories/AuthRepository.dart';

class LoginUser extends UseCase<ApiSuccess, LoginParams> {
  final AuthRepository authRepository;

  LoginUser({@required this.authRepository});
  @override
  Future<Either<Failure, ApiSuccess>> call(LoginParams params) {
    return authRepository.loginUser(params.email, params.password);
  }
}

class LoginParams extends Equatable {
  final String email, password;

  LoginParams({@required this.email, @required this.password});
  @override
  List<Object> get props => [email, password];
}
