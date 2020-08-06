import 'package:dartz/dartz.dart';

import '../../../core/errors/Failures.dart';
import '../../data/models/ShopModel.dart';
import '../../data/models/UserModel.dart';
import '../entities/ApiSuccess.dart';

abstract class AuthRepository {
  Future<Either<Failure, ApiSuccess>> registerUser(
      UserModel userModel, ShopModel shop);
  Future<Either<Failure, ApiSuccess>> loginUser(String email, String password);
  Future<Either<Failure, ApiSuccess>> refreshUser();
}
