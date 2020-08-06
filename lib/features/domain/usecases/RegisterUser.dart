import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../core/errors/Failures.dart';
import '../../../core/usecases/UseCases.dart';
import '../../data/models/ShopModel.dart';
import '../../data/models/UserModel.dart';
import '../entities/ApiSuccess.dart';
import '../repositories/AuthRepository.dart';

class RegisterUser extends UseCase<ApiSuccess, RegisterParams> {
  final AuthRepository authRepository;

  RegisterUser({@required this.authRepository});

  @override
  Future<Either<Failure, ApiSuccess>> call(RegisterParams params) {
    return authRepository.registerUser(params.userModel, params.shop);
  }
}

class RegisterParams extends Equatable {
  final UserModel userModel;
  final ShopModel shop;

  RegisterParams({@required this.userModel, @required this.shop});

  @override
  List<Object> get props => [userModel];
}
