import 'package:flutter_laravel_auth/features/data/models/AuthTokenModel.dart';
import 'package:flutter_laravel_auth/features/data/models/UserModel.dart';

abstract class AuthRemoteDataSource {
  Future<AuthTokenModel> registerUser(UserModel userModel);
  Future<AuthTokenModel> loginUser(String email, String password);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  @override
  Future<AuthTokenModel> loginUser(String email, String password) {}

  @override
  Future<AuthTokenModel> registerUser(UserModel userModel) {}
}
