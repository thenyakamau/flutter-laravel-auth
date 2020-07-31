import 'package:dartz/dartz.dart';

import '../../../core/errors/Failures.dart';
import '../../domain/entities/ApiSuccess.dart';
import '../../domain/repositories/AuthRepository.dart';
import '../models/UserModel.dart';

class AuthRepositoryImpl implements AuthRepository {
  @override
  Future<Either<Failure, ApiSuccess>> loginUser(
      String email, String password) {}

  @override
  Future<Either<Failure, ApiSuccess>> registerUser(UserModel userModel) {}
}
