import 'package:dartz/dartz.dart';

import '../../../core/errors/Failures.dart';
import '../../data/models/UserModel.dart';
import '../entities/ApiSuccess.dart';

abstract class AuthRepository {
  Future<Either<Failure, ApiSuccess>> registerUser(UserModel userModel);
  Future<Either<Failure, ApiSuccess>> loginUser(String email, String password);
}
